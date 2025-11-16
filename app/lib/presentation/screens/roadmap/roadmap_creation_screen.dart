import 'package:flutter/material.dart';

class RoadmapCreationScreen extends StatelessWidget {
  const RoadmapCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로드맵 생성')),
      body: const Center(child: Text('로드맵 생성 화면 (AI 제안 / 사용자 정의)')),
    );
  }
}

