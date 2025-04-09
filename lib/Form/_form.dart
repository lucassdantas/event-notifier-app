import 'package:flutter/material.dart';

class FormAddNewEvent extends StatefulWidget {
  const FormAddNewEvent({super.key});

  @override
  State<FormAddNewEvent> createState() => _FormAddNewEventState();
}

class _FormAddNewEventState extends State<FormAddNewEvent> {
  final _formKey = GlobalKey<FormState>();
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
          InputDatePickerFormField(
            firstDate: DateTime(1969, 1, 1),
            lastDate: DateTime(2100),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Nome do evento'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Preencha o nome do evento';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
