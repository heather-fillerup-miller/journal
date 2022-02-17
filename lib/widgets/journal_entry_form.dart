import 'package:flutter/material.dart';
import '../db/journal_entry_dto.dart';
import '../widgets/entry_field.dart';
import 'enter_date.dart';

class JournalEntryForm extends StatefulWidget {
  final bool darkTheme;
  final void Function(bool value) toggleDarkTheme;

  const JournalEntryForm(
      {Key? key, required this.darkTheme, required this.toggleDarkTheme})
      : super(key: key);

  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final _formKey = GlobalKey<FormState>();
  final JournalEntryDTO newEntry = JournalEntryDTO();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            EnterDate(saveMethod: newEntry.setDateTime),
            EntryField(title: 'Title', saveMethod: newEntry.setTitle),
            EntryField(title: 'Body', saveMethod: newEntry.setBody),
            EntryField(title: 'Rating', saveMethod: newEntry.setRating),
            const SizedBox(height: 5),
            saveButton(context),
          ],
        ),
      ),
    );
  }

  Widget saveButton(BuildContext context) {
    return ElevatedButton(
        child: const Text('Save'),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            //addDateToJournalEntryValues();
            Navigator.of(context).pop;
          }
        });
  }
}
