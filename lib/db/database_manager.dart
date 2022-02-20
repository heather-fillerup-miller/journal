import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static const String databaseFileName = 'journal.sqlite3.db';
  static const String sqlCreateShema =
      'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL);';

  static late DatabaseManager _instance;
  final Database db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance() => _instance;

  static Future initialize() async {
    final db = await openDatabase(databaseFileName, version: 1,
        onCreate: (Database db, int version) async {
      createTables(db, sqlCreateShema);
    });
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }
}
