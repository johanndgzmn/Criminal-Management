import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _ScheduleState();
}

class _ScheduleState extends State<SchedulePage> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  Icon getIconForDay(DateTime day) {
    final int weekday = day.weekday;
    switch (weekday) {
      case DateTime.monday:
      case DateTime.thursday:
        return const Icon(Icons.recycling, color: Colors.green);
      case DateTime.tuesday:
      case DateTime.friday:
        return const Icon(Icons.eco, color: Colors.blue);
      case DateTime.wednesday:
      case DateTime.saturday:
        return const Icon(Icons.shopping_cart, color: Colors.orange);
      default:
        return const Icon(Icons.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2021, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) {
            return Center(
              child: Text('${date.day}'),
            );
          },
          selectedBuilder: (context, date, _) {
            return Center(
              child: Text('${date.day}'),
            );
          },
          todayBuilder: (context, date, _) {
            return Center(
              child: Text('${date.day}'),
            );
          },
          markerBuilder: (context, date, events) {
            return getIconForDay(date);
          },
        ),
      ),
    );
  }
}
