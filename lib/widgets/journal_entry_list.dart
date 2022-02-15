import 'package:flutter/material.dart';
import '../models/journal_entry.dart';

class JournalEntryList extends StatelessWidget {
  final List<JournalEntry> journalEntries;

  const JournalEntryList({Key? key, required this.journalEntries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: journalEntries.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text('Journal Entry ${journalEntries[index].title}'),
            subtitle: Text(journalEntries[index].dateTime.toString()));
      },
    );
  }
}
