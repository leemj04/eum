import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  const EventTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: const Text('이벤트 제목'), subtitle: const Text('날짜/시간'));
  }
}

