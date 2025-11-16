import 'package:flutter/material.dart';

class RoadmapDetailScreen extends StatelessWidget {
  const RoadmapDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로드맵 상세')),
      body: const Center(child: Text('로드맵 상세 페이지')),
    );
  }
}

