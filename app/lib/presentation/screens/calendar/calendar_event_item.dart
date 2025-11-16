import 'package:flutter/material.dart';

class CalendarEventItem extends StatelessWidget {
  const CalendarEventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: const Text('이벤트'), subtitle: const Text('시간'));
  }
}
