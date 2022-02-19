import 'package:flutter/material.dart';

class EntryText extends StatelessWidget {
  final String title;
  final FocusNode inputOrder;
  final Function(String? value) saveMethod;

  const EntryText(
      {Key? key,
      required this.title,
      required this.saveMethod,
      required this.inputOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextFormField(
        focusNode: inputOrder,
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
