import 'package:flutter/material.dart';
import '../db/journal_entry_dto.dart';
import 'entry_text.dart';
import 'enty_date.dart';
import 'entry_rating.dart';

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
  FocusNode input1 = FocusNode();
  FocusNode input2 = FocusNode();
  FocusNode input3 = FocusNode();
  FocusNode input4 = FocusNode();

  @override
  void dispose() {
    input1.dispose();
    input2.dispose();
    input3.dispose();
    input4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EntryDate(
              saveMethod: newEntry.setDateTime,
              inputOrder: input1,
            ),
            EntryText(
              title: 'Title',
              saveMethod: newEntry.setTitle,
              inputOrder: input2,
            ),
            EntryText(
              title: 'Body',
              saveMethod: newEntry.setBody,
              inputOrder: input3,
            ),
            EntryRating(
              saveMethod: newEntry.setRating,
              inputOrder: input4,
            ),
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
            newEntry.dateTime ??= DateTime.now();
            newEntry.rating ??= 1;
            _formKey.currentState!.save();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Jounral Entry Saved!'),
            ));
            Navigator.of(context).pop();
          }
        });
  }
}
