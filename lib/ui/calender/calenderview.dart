import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starting_todo_app/utils/color.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../utils/constant.dart';
import 'event/events.dart';
import 'calenderlogic.dart';

class CalendarView extends StatefulWidget {
  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.colorGreen,
        foregroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: Text('Event Name', style: TextStyle(color: AppColor.darkGreen)),
                content: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: controller.eventController,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.colorGreen,
                      foregroundColor: AppColor.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    onPressed: () {
                      controller.addEvent(controller.eventController.text);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add', style: TextStyle(fontSize: 20)),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, size: 30),
      ),
      body: GetBuilder<CalendarController>(
        id: Constant.idHome,
        builder: (logic) {
          return Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: TableCalendar(
                    focusedDay: controller.focusedDay,
                    firstDay: DateTime.utc(2010, 8, 23),
                    lastDay: DateTime.utc(2030, 8, 23),
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.onDaySelected(selectedDay, focusedDay);
                    },
                    eventLoader: controller.getEventsForDay,
                    selectedDayPredicate: (day) => isSameDay(day, controller.selectedDay),
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: AppColor.colorGreen,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: AppColor.colorGreen,
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(
                        color: AppColor.white,
                      ),
                      markerDecoration: BoxDecoration(
                        color: AppColor.colorSecondaryLightYellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: AppColor.colorGreen),
                      weekendStyle: TextStyle(color: AppColor.colorGreen),
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        color: AppColor.darkGreen,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: AppColor.darkGreen,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: AppColor.darkGreen,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: controller.selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            onTap: () {},
                            title: Text(value[index].title, style: TextStyle(color: AppColor.darkGreen)),
                            trailing: Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.symmetric(vertical: 12),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: AppColor.colorGreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: IconButton(
                                color: AppColor.darkGreen,
                                iconSize: 18,
                                onPressed: () {
                                  controller.removeEvent(value[index]);
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}