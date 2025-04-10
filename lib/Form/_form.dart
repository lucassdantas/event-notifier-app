import 'package:flutter/material.dart';

class FormAddNewEvent extends StatefulWidget {
  final void Function(Map<String, dynamic>) onAddEvent;
  const FormAddNewEvent({super.key, required this.onAddEvent});

  @override
  State<FormAddNewEvent> createState() => _FormAddNewEventState();
}

class _FormAddNewEventState extends State<FormAddNewEvent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController notificationDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
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
            onTap: () => _selectEventDate(),
            readOnly: true,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Preencha a data do evento';
              }
              return null;
            },
          ),
          TextFormField(
            controller: notificationDateController,
            decoration: InputDecoration(
              hintText: 'Data da notificação',
              prefixIcon: Icon(Icons.calendar_month),
            ),
            onTap: () => _selectNotificationDate(),
            readOnly: true,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Preencha a data do evento';
              }
              return null;
            },
          ),
          ElevatedButton(onPressed: () {}, child: Text('Adicionar evento')),
        ],
      ),
    );
  }

  Future<void> _selectEventDate() async {
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

  Future<void> _selectNotificationDate() async {
    DateTime? choosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (choosenDate != null) {
      setState(
        () =>
            notificationDateController.text =
                choosenDate.toString().split(' ')[0],
      );
    }
  }
}
