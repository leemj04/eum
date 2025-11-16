import 'package:flutter/material.dart';

class RoadmapItemCard extends StatelessWidget {
  const RoadmapItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(title: const Text('로드맵 제목'), subtitle: const Text('간단 설명')));
  }
}

