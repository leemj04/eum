import 'package:flutter/material.dart';

class PolicyDetailScreen extends StatelessWidget {
  const PolicyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final id = args != null ? args['id'] as String? : 'unknown';

    return Scaffold(
      appBar: AppBar(title: const Text('정책 상세')),
      body: Center(child: Text('정책 상세: $id')),
    );
  }
}
