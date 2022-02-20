import 'package:flutter/material.dart';
import '../models/journal_entry.dart';
import '../widgets/entry_tile_detailed.dart';
import '../widgets/entry_tile_short.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth < 500
          ? verticalLayout(context, constraints)
          : horizontalLayout(context, constraints);
    });
  }

  Widget verticalLayout(BuildContext context, BoxConstraints constraints) {
    return ListView.builder(
      itemCount: journalEntries.length,
      itemBuilder: (context, index) {
        return Card(
            child: ShortEntryTile(
                entry: journalEntries[index],
                darkTheme: darkTheme,
                toggleDarkTheme: toggleDarkTheme));
      },
    );
  }

  Widget horizontalLayout(BuildContext context, BoxConstraints constraints) {
    return ListView.builder(
      itemCount: journalEntries.length,
      itemBuilder: (context, index) {
        return Card(
            child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ShortEntryTile(
                  entry: journalEntries[index],
                  darkTheme: darkTheme,
                  toggleDarkTheme: toggleDarkTheme),
            ),
            Expanded(
                flex: 7, child: DetailEntryTile(entry: journalEntries[index]))
          ],
        ));
      },
    );
  }
}
