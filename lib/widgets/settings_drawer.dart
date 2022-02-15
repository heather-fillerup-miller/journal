import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;

  const SettingsDrawer(
      {Key? key, required this.darkTheme, required this.toggleDarkTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 75,
            child: DrawerHeader(
              child: Text('Settings'),
            ),
          ),
          ListTile(
            dense: true,
            title: const Text('Dark Theme'),
            trailing: CupertinoSwitch(
                value: darkTheme, onChanged: (value) => toggleDarkTheme(value)),
          )
        ],
      ),
    );
  }
}
