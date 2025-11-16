import 'package:flutter/material.dart';
import 'package:eum/presentation/widgets/ai_recommendation/ai_recommendation_list.dart';

class AIRecommendationImpl extends StatelessWidget {
  const AIRecommendationImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI 추천 - 구현')),
      body: const AIRecommendationList(),
    );
  }
}
