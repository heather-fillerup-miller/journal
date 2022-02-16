import 'package:flutter/material.dart';
import '../models/journal.dart';
import '../widgets/journal_entry_list.dart';
import '../widgets/journal_scaffold.dart';

class JournalEntryListScreen extends StatefulWidget {
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;
  static const routeKey = 'journal_entries';
  final Journal journal;

  const JournalEntryListScreen(
      {Key? key,
      required this.darkTheme,
      required this.toggleDarkTheme,
      required this.journal})
      : super(key: key);

  @override
  _JournalEntryListScreenState createState() => _JournalEntryListScreenState();
}

class _JournalEntryListScreenState extends State<JournalEntryListScreen> {
  final String title = "Entry List";

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: title,
      allowNewEntry: true,
      darkTheme: widget.darkTheme,
      toggleDarkTheme: widget.toggleDarkTheme,
      routeBody: JournalEntryList(
          darkTheme: widget.darkTheme,
          toggleDarkTheme: widget.toggleDarkTheme,
          journalEntries: widget.journal.journalEntries),
    );
  }
}
