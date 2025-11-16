import 'package:flutter/material.dart';

class PolicyCard extends StatelessWidget {
  const PolicyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(children: const [Text('정책 제목'), SizedBox(height:8), Text('간단한 설명')])));
  }
}

