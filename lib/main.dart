import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './app.dart';
import './db/database_manager.dart';

const journalDatabaseSchema = 'assets/journal_schema.txt';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    //set our allow device orientations
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);

  final String schema = await rootBundle.loadString(journalDatabaseSchema);

  await DatabaseManager.initialize(schema);

  runApp(MyApp(prefs: await SharedPreferences.getInstance()));
}
