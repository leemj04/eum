import 'package:flutter/material.dart';
import 'policy_list_item.dart';

class PolicyExplorationScreenImpl extends StatelessWidget {
  const PolicyExplorationScreenImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('정책 탐색 - 구현')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const PolicyListItem(),
      ),
    );
  }
}

