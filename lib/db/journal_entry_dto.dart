class JournalEntryDTO {
  String? title;
  String? body;
  DateTime? dateTime;
  int? rating;

  JournalEntryDTO({this.title, this.body, this.dateTime, this.rating});

  void setTitle(value) => title = value;
  void setBody(value) => body = value;
  void setDateTime(value) => dateTime = value;
  void setRating(value) => rating = value;
}
