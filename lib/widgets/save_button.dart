import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../db/journal_entry_dto.dart';

class SaveButton extends StatelessWidget {
  GlobalKey<FormState> formKey;
  JournalEntryDTO newEntry;
  SaveButton({Key? key, required this.formKey, required this.newEntry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('Save'),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            newEntry.dateTime ??= DateTime.now();
            newEntry.rating ??= 1;
            formKey.currentState!.save();
            saveToDatabase(newEntry);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Jounral Entry Saved!'),
            ));
            Navigator.of(context).popAndPushNamed('/');
          }
        });
  }

  void saveToDatabase(JournalEntryDTO newEntry) async {
    final Database database = await openDatabase('journal.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL);');
    });
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?);',
          [
            newEntry.title,
            newEntry.body,
            newEntry.rating,
            newEntry.dateTime.toString()
          ]);
    });
    await database.close();
  }
}
