import 'package:flutter/material.dart';

class AIRecommendationScreen extends StatelessWidget {
  const AIRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI 추천')),
      body: const Center(child: Text('AI 추천 페이지 (LLM 대화형 추천)')),
    );
  }
}

