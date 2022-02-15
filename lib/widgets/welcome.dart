import 'package:flutter/material.dart';
import 'journal_scaffold.dart';

class Welcome extends StatefulWidget {
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;

  const Welcome(
      {Key? key, required this.darkTheme, required this.toggleDarkTheme})
      : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final String title = "Welcome";

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      darkTheme: widget.darkTheme,
      toggleDarkTheme: widget.toggleDarkTheme,
      title: title,
      allowNewEntry: true,
      routeBody: (Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.book_rounded, size: 150),
            Text(
              "Journal",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      )),
    );
  }
}
