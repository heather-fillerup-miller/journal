import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/journal_entry_list_screen.dart';

class MyApp extends StatefulWidget {
  final SharedPreferences prefs;

  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const themeKey = 'darkTheme';
  static const userKey = 'newUser';

  //start with dart theme and new user
  bool get getDarkTheme => widget.prefs.getBool(themeKey) ?? false;
  //bool get getNewUser => widget.prefs.getBool(USER_KEY) ?? true;

  //toggle the theme in preferences
  void toggleDarkTheme(bool value) {
    widget.prefs.setBool(themeKey, value);
    setState(() => {});
  }

  /*//change the user
  void returningUser(bool value) {
    widget.prefs.setBool(USER_KEY, value);
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: getDarkTheme ? Brightness.dark : Brightness.light,
      ),
      routes: {
        //adjust on first visit
        '/': (context) => JournalEntryListScreen(
              darkTheme: getDarkTheme,
              toggleDarkTheme: toggleDarkTheme,
            )
      },
    );
  }
}
