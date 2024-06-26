import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;
  final String title = "Welcome";

  const Welcome(
      {Key? key, required this.darkTheme, required this.toggleDarkTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.book_rounded, size: 150),
          Text(
            "Journal",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
