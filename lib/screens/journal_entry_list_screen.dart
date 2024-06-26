import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_entry_list.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/welcome.dart';

class JournalEntryListScreen extends StatefulWidget {
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;
  static const routeKey = 'journal_entries';
  Journal? journal;

  JournalEntryListScreen(
      {Key? key, required this.darkTheme, required this.toggleDarkTheme})
      : super(key: key);

  @override
  _JournalEntryListScreenState createState() => _JournalEntryListScreenState();
}

class _JournalEntryListScreenState extends State<JournalEntryListScreen> {
  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.journal == null) {
      loadJournal(); //ensure journal is loaded when theme is toggled
      return JournalScaffold(
          toggleDarkTheme: widget.toggleDarkTheme,
          darkTheme: widget.darkTheme,
          allowNewEntry: false,
          title: "Loading Journal",
          routeBody: const Center(child: CircularProgressIndicator()));
    } else {
      return JournalScaffold(
          title: widget.journal!.journalEntries.isEmpty
              ? 'Welcome'
              : 'Journal Entries',
          allowNewEntry: true,
          darkTheme: widget.darkTheme,
          toggleDarkTheme: widget.toggleDarkTheme,
          routeBody: widget.journal!.journalEntries.isEmpty
              ? Welcome(
                  darkTheme: widget.darkTheme,
                  toggleDarkTheme: widget.toggleDarkTheme,
                )
              : JournalEntryList(
                  darkTheme: widget.darkTheme,
                  toggleDarkTheme: widget.toggleDarkTheme,
                  journalEntries: widget.journal!.journalEntries));
    }
  }

  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    List<JournalEntry> journalRecords =
        await databaseManager.loadJournalEntries();
    setState(() {
      widget.journal = Journal(journalEntries: journalRecords);
    });
  }
}
