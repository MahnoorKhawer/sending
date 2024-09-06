import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constant.dart';
import '../notification/notificationLogic.dart';
import 'event/events.dart';

class CalendarController extends GetxController {
  final Notificationlogic notificationController = Get.put(Notificationlogic());
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  Map<DateTime, List<Event>> events = {};
  TextEditingController eventController = TextEditingController();
  late final ValueNotifier<List<Event>> selectedEvents;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    selectedDay = focusedDay;
    selectedEvents = ValueNotifier(getEventsForDay(selectedDay!));

    try {
      loadEventsFromFirestore();
    } catch (e) {
      print("Error loading events: $e");
    }
  }


  List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  List<Map<String, dynamic>> getAllEvents() {
    List<Map<String, dynamic>> allEvents = [];

    events.forEach((date, eventList) {
      for (var event in eventList) {
        allEvents.add({
          'date': date,
          'title': event.title,
        });
      }
    });

    return allEvents;
  }


  Future<void> removeEvent(Event event) async {
    if (selectedDay != null) {
      events[selectedDay!]!.remove(event);
      await firestore.collection('events')
          .where('date', isEqualTo: Timestamp.fromDate(selectedDay!))
          .where('title', isEqualTo: event.title)
          .get()
          .then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });
      loadEventsForDay(selectedDay!);
      update([Constant.idHome]);
    }
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay = selectedDay;
    this.focusedDay= focusedDay;
    loadEventsForDay(selectedDay);
    update([Constant.idHome]);
  }

  void loadEventsForDay(DateTime selectedDay) {
    selectedEvents.value = events[selectedDay] ?? [];
  }
  void addEvent(String eventName) async {
    final newEvent = Event(eventName);

    if (events[selectedDay] != null) {
      events[selectedDay]!.add(newEvent);
    } else {
      events[selectedDay!] = [newEvent];
    }

    selectedEvents.value = getEventsForDay(selectedDay!);
    loadEventsForDay(selectedDay!);
    update([Constant.idHome]);

    // Add event to Firestore
    try {
      await firestore.collection('events').add({
        'title': eventName,
        'date': Timestamp.fromDate(selectedDay!),
      });
      notificationController.showNotification(
        title: 'Event Added: $eventName',
      );
      print("Event added to Firestore successfully!");
    } catch (e) {
      print("Failed to add event to Firestore: $e");
    }
  }


  void loadEventsFromFirestore() async {
    firestore.collection('events').get().then((snapshot) {
      for (var doc in snapshot.docs) {
        final eventDate = (doc['date'] as Timestamp).toDate();
        final eventTitle = doc['title'];

        if (events[eventDate] != null) {
          events[eventDate]!.add(Event(eventTitle));
        } else {
          events[eventDate] = [Event(eventTitle)];
        }
      }
      loadEventsForDay(selectedDay!);
      update([Constant.idHome]);
    });
  }

  @override
  void onClose() {
    eventController.dispose();
    selectedEvents.dispose();
    super.onClose();
  }
}
