import 'package:event_notifier/Event/_event.dart';
import 'package:flutter/material.dart';
import 'package:event_notifier/Form/_form.dart';

Future<void> newEventDialog(
  BuildContext context,
  void Function(Event) onSubmit,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Adicionar novo evento'),
        content: FormAddNewEvent(event: null, onSubmit: onSubmit),
      );
    },
  );
}

Future<void> editEventDialog(
  BuildContext context,
  Event event,
  void Function(Event) onSubmit,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Editar evento'),
        content: FormAddNewEvent(event: event, onSubmit: onSubmit),
      );
    },
  );
}
