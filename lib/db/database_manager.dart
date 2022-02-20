import 'package:journal/models/journal_entry.dart';
import 'package:sqflite/sqflite.dart';
import './journal_entry_dto.dart';

class DatabaseManager {
  static const String databaseFileName = 'journal.sqlite3.db';
  static const String sqlCreateShema =
      'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL);';
  static const String sqlInsert =
      'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?);';
  static const String sqlSelect = ('SELECT * FROM journal_entries');
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

  void saveJournalEntry(JournalEntryDTO dto) async {
    db.transaction((txn) async {
      await txn.rawInsert(sqlInsert,
          [dto.title, dto.body, dto.rating, dto.dateTime.toString()]);
    });
  }

  Future<List<JournalEntry>> loadJournalEntries() async {
    final List<Map>journalRecords = await db.rawQuery(sqlSelect);
    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
          id: record['id'],
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          dateTime: DateTime.parse(record['date']));
    }).toList();
    return journalEntries;
  }
}
