import 'package:flutter/material.dart';
import 'package:eum/core/routes/route_paths.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('대시보드')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('대시보드 컨텐츠가 여기에 표시됩니다.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(RoutePaths.policyExploration),
              child: const Text('정책 탐색으로 이동'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(RoutePaths.chat),
              child: const Text('채팅으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
