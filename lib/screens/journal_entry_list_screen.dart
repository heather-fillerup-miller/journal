import 'package:flutter/material.dart';
import '../widgets/journal_scaffold.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_entry_list.dart';

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
  final String title = "Journal Entries";
  final Journal journal = Journal(journalEntries: [
    JournalEntry(
        body: 'Legs',
        title: 'Workout1',
        id: 1,
        dateTime: DateTime.now(),
        rating: 3),
    JournalEntry(
        body: 'Back and Biceps',
        title: 'Workout2',
        id: 2,
        dateTime: DateTime.now(),
        rating: 4),
  ]);

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: title,
      allowNewEntry: true,
      darkTheme: widget.darkTheme,
      toggleDarkTheme: widget.toggleDarkTheme,
      routeBody: JournalEntryList(journalEntries: journal.journalEntries),
    );
  }
}
