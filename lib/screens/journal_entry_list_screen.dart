import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_entry_list.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/welcome.dart';

class JournalEntryListScreen extends StatefulWidget {
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;
  static const routeKey = 'journal_entries';

  const JournalEntryListScreen(
      {Key? key, required this.darkTheme, required this.toggleDarkTheme})
      : super(key: key);

  @override
  _JournalEntryListScreenState createState() => _JournalEntryListScreenState();
}

class _JournalEntryListScreenState extends State<JournalEntryListScreen> {
  Journal journal = Journal(journalEntries: []);

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  @override
  Widget build(BuildContext context) {
    if (journal.journalEntries.isEmpty) {
      return JournalScaffold(
          toggleDarkTheme: widget.toggleDarkTheme,
          darkTheme: widget.darkTheme,
          allowNewEntry: false,
          title: "Loading Journal",
          routeBody: const Center(child: CircularProgressIndicator()));
    }
    return JournalScaffold(
        title: journal.journalEntries.isEmpty ? 'Welcome' : 'Journal Entries',
        allowNewEntry: true,
        darkTheme: widget.darkTheme,
        toggleDarkTheme: widget.toggleDarkTheme,
        routeBody: journal.journalEntries.isEmpty
            ? Welcome(
                darkTheme: widget.darkTheme,
                toggleDarkTheme: widget.toggleDarkTheme,
              )
            : JournalEntryList(
                darkTheme: widget.darkTheme,
                toggleDarkTheme: widget.toggleDarkTheme,
                journalEntries: journal.journalEntries));
  }

  void loadJournal() async {
    final Database database = await openDatabase('journal.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL);');
    });
    List<Map> journalRecords =
        await database.rawQuery('SELECT * FROM journal_entries');
    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
          id: record['id'],
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          dateTime: DateTime.parse(record['date']));
    }).toList();
    setState(() {
      journal = Journal(journalEntries: journalEntries);
    });
  }
}
