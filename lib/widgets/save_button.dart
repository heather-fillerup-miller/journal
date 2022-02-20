import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../db/journal_entry_dto.dart';

class SaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final JournalEntryDTO newEntry;
  const SaveButton({Key? key, required this.formKey, required this.newEntry})
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
    final databaseManager = DatabaseManager.getInstance();
    databaseManager.saveJournalEntry(newEntry);
  }
}
