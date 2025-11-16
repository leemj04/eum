import 'package:flutter/material.dart';

class AIRecommendationList extends StatelessWidget {
  const AIRecommendationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(title: Text('추천 1')),
        ListTile(title: Text('추천 2')),
      ],
    );
  }
}
