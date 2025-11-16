import 'package:flutter/material.dart';

class AIPolicyCard extends StatelessWidget {
  const AIPolicyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(children: const [Text('AI 추천 정책'), SizedBox(height:8), Text('설명')] )));
  }
}
