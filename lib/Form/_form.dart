import 'package:event_notifier/Event/_event.dart';
import 'package:flutter/material.dart';

class FormAddNewEvent extends StatefulWidget {
  final Event? event;
  final void Function(Event newEvent) onSubmit;

  const FormAddNewEvent({super.key, this.event, required this.onSubmit});

  @override
  State<FormAddNewEvent> createState() => _FormAddNewEventState();
}

class _FormAddNewEventState extends State<FormAddNewEvent> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController eventDateController;
  late TextEditingController notificationDateController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.event?.title ?? '');
    eventDateController = TextEditingController(
      text: widget.event?.eventDate.toString().split(' ')[0] ?? '',
    );
    notificationDateController = TextEditingController(
      text: widget.event?.notificationDate.toString().split(' ')[0] ?? '',
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    eventDateController.dispose();
    notificationDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Nome do evento'),
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'Campo obrigatório' : null,
          ),
          TextFormField(
            controller: eventDateController,
            decoration: InputDecoration(
              hintText: 'Data do evento',
              prefixIcon: Icon(Icons.calendar_today),
            ),
            onTap: _selectEventDate,
            readOnly: true,
          ),
          TextFormField(
            controller: notificationDateController,
            decoration: InputDecoration(
              hintText: 'Data da notificação',
              prefixIcon: Icon(Icons.notifications),
            ),
            onTap: _selectNotificationDate,
            readOnly: true,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final newEvent = Event(
                  titleController.text,
                  DateTime.parse(eventDateController.text),
                  DateTime.parse(notificationDateController.text),
                );
                widget.onSubmit(newEvent);
                Navigator.of(context).pop(); // Fecha o diálogo
              }
            },
            child: Text(widget.event == null ? 'Adicionar' : 'Salvar'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectEventDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.event?.eventDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        eventDateController.text = picked.toString().split(' ')[0];
      });
    }
  }

  Future<void> _selectNotificationDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.event?.notificationDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        notificationDateController.text = picked.toString().split(' ')[0];
      });
    }
  }
}
