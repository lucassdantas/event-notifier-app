import 'package:flutter/material.dart';

class FormAddNewEvent extends StatefulWidget {
  const FormAddNewEvent({super.key});

  @override
  State<FormAddNewEvent> createState() => _FormAddNewEventState();
}

class _FormAddNewEventState extends State<FormAddNewEvent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController eventDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Nome do evento'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Preencha o nome do evento';
              }
              return null;
            },
          ),
          TextFormField(
            controller: eventDateController,

            decoration: InputDecoration(
              hintText: 'Data do evento',
              prefixIcon: Icon(Icons.calendar_month),
            ),
            onTap: () => _selectDate(),
            readOnly: true,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Preencha a data do evento';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? choosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (choosenDate != null) {
      setState(
        () => eventDateController.text = choosenDate.toString().split(' ')[0],
      );
    }
  }
}
