import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final String title;
  final Function(String? value) saveMethod;

  const EntryField({Key? key, required this.title, required this.saveMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
            labelText: title, border: const OutlineInputBorder()),
        onSaved: (value) {
          saveMethod(value);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a {$title}';
          }
          return null;
        },
      ),
    );
  }
}
