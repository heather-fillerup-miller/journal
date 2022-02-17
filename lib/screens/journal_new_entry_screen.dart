import 'package:flutter/material.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/journal_entry_form.dart';

class JournalNewEntryScreen extends StatelessWidget {
  final bool darkTheme;
  final void Function(bool) toggleDarkTheme;
  final title = 'New Journal Entry';

  const JournalNewEntryScreen(
      {Key? key, required this.darkTheme, required this.toggleDarkTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: title,
      allowNewEntry: false,
      darkTheme: darkTheme,
      toggleDarkTheme: toggleDarkTheme,
      routeBody: JournalEntryForm(darkTheme: darkTheme, toggleDarkTheme: toggleDarkTheme,),
    );
  }
}
