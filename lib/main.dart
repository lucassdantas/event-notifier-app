import 'package:event_notifier/Event/_event.dart';
import 'package:flutter/material.dart';
import 'package:event_notifier/Event/_event_list.dart';
import 'package:event_notifier/Dialog/_dialog.dart';
import 'package:event_notifier/services/_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Notifier',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Event> events = [];

  void addEvent(Event event) {
    setState(() {
      events.add(event);
    });
  }

  void updateEvent(Event event, int index) {
    setState(() {
      events[index] = event;
    });
  }

  void deleteEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Notifier'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: EventList(
              events: events,
              onEdit: (event, index) {
                editEventDialog(context, event, (updatedEvent) {
                  updateEvent(updatedEvent, index);
                });
              },
              onDelete: deleteEvent,
            ),
          ),
          SafeArea(
            child: Center(
              child: TextButton(
                onPressed: () {
                  newEventDialog(context, (event) {
                    addEvent(event);
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                ),
                child: const Text(
                  'Adicionar novo evento',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
