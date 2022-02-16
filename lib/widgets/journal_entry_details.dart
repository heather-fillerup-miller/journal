import 'package:flutter/material.dart';
import '../models/journal_entry.dart';

class JournalEntryDetails extends StatelessWidget {
  final JournalEntry entry;

  const JournalEntryDetails({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  entry.getStyledDate,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  children: [
                    Text(
                      entry.title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const Spacer(flex: 20),
                    const Icon(Icons.star_border_outlined),
                    const Spacer(flex: 1),
                    Text(
                      entry.rating.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
              Text(
                entry.body,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
      ));
    });
  }
}
