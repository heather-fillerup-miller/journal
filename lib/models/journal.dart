import 'package:journal/models/journal_entry.dart';
import './journal_entry.dart';

class Journal {
  List<JournalEntry> journalEntries;

  Journal({required this.journalEntries});

  Journal.fake()
      : journalEntries = [
          JournalEntry(
              body: 'Squats 5 x 25 \nLeg Press t5 x 100',
              title: 'Leg Workout',
              id: 1,
              dateTime: DateTime.now(),
              rating: 3),
          JournalEntry(
              body: 'Barbell Row\t5 x 45 \nDumbbell Bicep Curls\t5 x 20',
              title: 'Back and Biceps',
              id: 2,
              dateTime: DateTime.now(),
              rating: 4),
        ];
}
