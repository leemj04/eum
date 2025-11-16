import 'package:flutter/material.dart';

class PolicyCardLarge extends StatelessWidget {
  const PolicyCardLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(children: const [Text('정책 제목 (큰)'), SizedBox(height:8), Text('상세 설명')] )));
  }
}
