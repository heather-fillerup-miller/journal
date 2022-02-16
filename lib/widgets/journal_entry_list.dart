import 'package:flutter/material.dart';
import '../screens/journal_entry_screen.dart';
import '../models/journal_entry.dart';

class JournalEntryList extends StatelessWidget {
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;
  final List<JournalEntry> journalEntries;

  const JournalEntryList({
    Key? key,
    required this.journalEntries,
    required this.darkTheme,
    required this.toggleDarkTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: journalEntries.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(journalEntries[index].title),
            subtitle: Text(journalEntries[index].getStyledDate),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JournalEntryScreen(
                          darkTheme: darkTheme,
                          toggleDarkTheme: toggleDarkTheme,
                          entry: journalEntries[index])));
            });
      },
    );
  }
}
