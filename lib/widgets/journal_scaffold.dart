import 'package:flutter/material.dart';
import 'settings_drawer.dart';
import '../screens/journal_new_entry_screen.dart';

class JournalScaffold extends StatefulWidget {
  final String title;
  final bool allowNewEntry;
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;
  final Widget routeBody;

  const JournalScaffold(
      {Key? key,
      required this.title,
      required this.darkTheme,
      required this.toggleDarkTheme,
      required this.routeBody,
      required this.allowNewEntry})
      : super(key: key);

  @override
  _JournalScaffoldState createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (widget.allowNewEntry) {
      return Scaffold(
        key: _scaffoldKey,
        endDrawer: SettingsDrawer(
          darkTheme: widget.darkTheme,
          toggleDarkTheme: widget.toggleDarkTheme,
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            )
          ],
        ),
        body: widget.routeBody,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JournalNewEntryScreen(
                        darkTheme: widget.darkTheme,
                        toggleDarkTheme: widget.toggleDarkTheme)))
          }, //go to journal entry form
          tooltip: 'New Entry',
          child: const Icon(Icons.add),
        ),
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawer: SettingsDrawer(
        darkTheme: widget.darkTheme,
        toggleDarkTheme: widget.toggleDarkTheme,
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pop()),
        centerTitle: true,
        title: Text(
          widget.title,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
          )
        ],
      ),
      body: widget.routeBody,
    );
  }
}
