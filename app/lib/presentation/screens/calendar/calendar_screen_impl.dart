import 'package:flutter/material.dart';
import 'calendar_event_item.dart';

class CalendarScreenImpl extends StatelessWidget {
  const CalendarScreenImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('캘린더 - 구현')),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => const CalendarEventItem(),
      ),
    );
  }
}
