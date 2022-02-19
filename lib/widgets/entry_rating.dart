import 'package:flutter/material.dart';

class EntryRating extends StatefulWidget {
  final Function(int value) saveMethod;
  final FocusNode inputOrder;

  const EntryRating(
      {Key? key, required this.saveMethod, required this.inputOrder})
      : super(key: key);

  @override
  State<EntryRating> createState() => _EntryRatingState();
}

class _EntryRatingState extends State<EntryRating> {
  int dropdownValue = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: DropdownButtonFormField<int>(
        focusNode: widget.inputOrder,
        decoration: const InputDecoration(
          labelText: "Rating",
          prefixIcon: Icon(Icons.star_border_outlined),
          border: OutlineInputBorder(),
        ),
        //elevation: 16,
        value: dropdownValue,
        onChanged: (int? newValue) {
          setState(() {
            dropdownValue = newValue!;
            widget.inputOrder.requestFocus();
          });
          widget.saveMethod(dropdownValue);
        },
        items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );
  }
}
