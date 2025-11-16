import 'package:flutter/material.dart';
import 'roadmap_list_item.dart';

class RoadmapScreenImpl extends StatelessWidget {
  const RoadmapScreenImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로드맵 - 구현')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => const RoadmapListItem(),
      ),
    );
  }
}
