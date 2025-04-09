import 'package:flutter/material.dart';
import 'package:event_notifier/Form/_form.dart';

Future<void> newEventDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Adicionar novo evento'),
        content: FormAddNewEvent(),
      );
    },
  );
}
