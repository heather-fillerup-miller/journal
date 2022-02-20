import 'package:flutter/material.dart';
import '../screens/journal_entry_screen.dart';
import '../models/journal_entry.dart';

class ShortEntryTile extends StatelessWidget {
  final JournalEntry entry;
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;
  const ShortEntryTile(
      {Key? key,
      required this.entry,
      required this.darkTheme,
      required this.toggleDarkTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(entry.title),
        subtitle: Text(entry.getLongStyledDate),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JournalEntryScreen(
                      darkTheme: darkTheme,
                      toggleDarkTheme: toggleDarkTheme,
                      entry: entry)));
        });
  }
}
