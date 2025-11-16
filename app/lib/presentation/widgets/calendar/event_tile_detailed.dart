import 'package:flutter/material.dart';

class EventTileDetailed extends StatelessWidget {
  const EventTileDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: const Text('이벤트 제목'), subtitle: const Text('상세 정보'), trailing: const Icon(Icons.chevron_right));
  }
}
