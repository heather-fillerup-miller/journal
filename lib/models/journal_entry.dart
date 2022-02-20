import 'package:intl/intl.dart';

class JournalEntry {
  int id;
  String title;
  String body;
  DateTime dateTime;
  int rating;

  JournalEntry(
      {required this.id,
      required this.title,
      required this.body,
      required this.dateTime,
      required this.rating});

  @override
  String toString() =>
      'Title: $title, Body: $body, Time: $dateTime, Rating: $rating';

  String get getShortStyledDate => DateFormat.yMd().format(dateTime);
  String get getLongStyledDate => DateFormat.yMMMMd('en_US').format(dateTime);
}
