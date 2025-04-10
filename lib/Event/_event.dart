import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  List events = [
    {
      'title': 'aa',
      'eventDate': '2025-07-01',
      'notificationDate': '2025-06-01',
    },
  ];

  void addEvent(event) {
    setState(() {
      events.add(event);
    });
  }

  void removeEvent(event) {
    setState(() {
      events.remove(event);
    });
  }

  void updateEvent(newEvent, position) {
    setState(() {
      events[position] = newEvent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          events.map<Widget>((event) {
            return Row(
              children: [
                Text(event['title'], style: TextStyle(color: Colors.black)),
                Text(event['eventDate']),
                Text(event['notificationDate']),
              ],
            );
          }).toList(),
    );
  }
}
