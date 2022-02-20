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
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth < 500
          ? verticalLayout(context, constraints)
          : horizontalLayout(context, constraints);
    });
  }

  Widget verticalLayout(BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight,
      child: ListView.builder(
        itemCount: journalEntries.length,
        itemBuilder: (context, index) {
          return Card(child: shortEntryTile(context, journalEntries[index]));
        },
      ),
    );
  }

  Widget horizontalLayout(BuildContext contex, BoxConstraints constraints) {
    return Row(
      children: [
        shortEntryListView(constraints),
        detailedEntryListView(constraints)
      ],
    );
  }

  Widget shortEntryListView(BoxConstraints constraints) {
    return Expanded(
      child: SizedBox(
        height: constraints.maxHeight,
        child: ListView.builder(
          itemCount: journalEntries.length,
          itemBuilder: (context, index) {
            return Card(child: shortEntryTile(context, journalEntries[index]));
          },
        ),
      ),
    );
  }

  Widget detailedEntryListView(BoxConstraints constraints) {
    return Expanded(
      child: SizedBox(
        height: constraints.maxHeight,
        child: ListView.builder(
          itemCount: journalEntries.length,
          itemBuilder: (context, index) {
            return Card(child: detailEntryTile(journalEntries[index]));
          },
        ),
      ),
    );
  }

  Widget shortEntryTile(BuildContext context, JournalEntry entry) {
    return ListTile(
        title: Text(entry.title),
        subtitle: Text(entry.getStyledDate),
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

  Widget detailEntryTile(JournalEntry entry) {
    return ListTile(
      leading: Text(entry.getStyledDate),
      title: Text(entry.title),
      subtitle: Text(entry.body),
      trailing: Column(
        children: [
          const Icon(Icons.star_border_outlined),
          Text(entry.rating.toString()),
        ],
      ),
    );
  }
}
