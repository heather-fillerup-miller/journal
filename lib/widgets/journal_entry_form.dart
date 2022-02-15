import 'package:flutter/material.dart';
import '../db/journal_entry_dto.dart';

class JournalEntryForm extends StatefulWidget {
  final newEntry = JournalEntryDTO();

  JournalEntryForm({Key? key}) : super(key: key);

  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
              onSaved: (value) {
                widget.newEntry.title = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
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
