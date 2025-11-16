import 'package:flutter/material.dart';
import 'package:eum/core/routes/route_paths.dart';
import 'policy_list_item.dart';

class PolicyExplorationScreen extends StatelessWidget {
  const PolicyExplorationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('정책 탐색')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.of(context).pushNamed(RoutePaths.policyDetail, arguments: {'id': 'policy_$index'}),
            child: const PolicyListItem(),
          );
        },
      ),
    );
  }
}
