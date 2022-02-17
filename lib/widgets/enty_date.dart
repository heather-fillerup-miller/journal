import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryDate extends StatefulWidget {
  final Function(DateTime value) saveMethod;

  const EntryDate({Key? key, required this.saveMethod}) : super(key: key);

  @override
  State<EntryDate> createState() => _EntryDateState();
}

class _EntryDateState extends State<EntryDate> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextField(
        controller: dateInput,
        decoration: const InputDecoration(
          labelText: "Date",
          border: OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100));
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() {
              dateInput.text = formattedDate;
              widget.saveMethod(pickedDate);
            });
          } else {
            dateInput.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
            widget.saveMethod(DateTime.now());
          }
        },
      ),
    );
  }
}
