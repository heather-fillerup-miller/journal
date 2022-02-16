import 'package:flutter/material.dart';
import 'package:journal/widgets/journal_scaffold.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_entry_details.dart';

class JournalEntryScreen extends StatelessWidget {
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;
  final JournalEntry entry;
  final routeKey = 'entry_details';

  final title = 'Entry Details';
  const JournalEntryScreen(
      {Key? key,
      required this.darkTheme,
      required this.toggleDarkTheme,
      required this.entry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
        title: title,
        darkTheme: darkTheme,
        toggleDarkTheme: toggleDarkTheme,
        routeBody: JournalEntryDetails(
          entry: entry,
        ),
        allowNewEntry: false);
  }
}
