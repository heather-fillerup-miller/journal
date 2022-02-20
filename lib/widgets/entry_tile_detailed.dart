import 'package:flutter/material.dart';
import '../models/journal_entry.dart';

class DetailEntryTile extends StatelessWidget {
  final JournalEntry entry;
  const DetailEntryTile({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        children: [
          const Icon(Icons.star_border_outlined),
          Text(entry.rating.toString()),
        ],
      ),
      title: Text(entry.title),
      subtitle: Text(entry.body),
      trailing: Text(entry.getShortStyledDate),
    );
  }
}
