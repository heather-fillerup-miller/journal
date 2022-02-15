class JournalEntryDTO {
  String? title;
  String? body;
  DateTime? dateTime;
  int? rating;

  JournalEntryDTO({this.title, this.body,this.dateTime, this.rating});

  @override
  String toString() =>
      'Title: $title, Body: $body, Time: $dateTime, Rating: $rating';
}