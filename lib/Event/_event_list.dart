import 'package:event_notifier/Event/_event.dart';
import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  final List<Event> events;
  final void Function(Event event, int index) onEdit;
  final void Function(int index) onDelete;

  const EventList({
    super.key,
    required this.events,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          title: Text(event.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Evento: ${event.eventDate.toString().split(' ')[0]}'),
              Text(
                'Notificação: ${event.notificationDate.toString().split(' ')[0]}',
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => onEdit(event, index),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onDelete(index),
              ),
            ],
          ),
        );
      },
    );
  }
}
