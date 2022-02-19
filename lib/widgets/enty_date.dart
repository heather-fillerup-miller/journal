import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryDate extends StatefulWidget {
  final Function(DateTime value) saveMethod;
  final FocusNode inputOrder;

  const EntryDate(
      {Key? key, required this.saveMethod, required this.inputOrder})
      : super(key: key);

  @override
  State<EntryDate> createState() => _EntryDateState();
}

class _EntryDateState extends State<EntryDate> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = DateFormat('MM-dd-yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextFormField(
        autofocus: true,
        focusNode: widget.inputOrder,
        controller: dateInput,
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today_outlined),
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
            String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
            setState(() {
              dateInput.text = formattedDate;
              widget.saveMethod(pickedDate);
            });
          }
        },
      ),
    );
  }
}
