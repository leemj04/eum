import 'package:flutter/material.dart';

class RoadmapListItem extends StatelessWidget {
  const RoadmapListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: const Text('로드맵 제목'), subtitle: const Text('요약'));
  }
}
