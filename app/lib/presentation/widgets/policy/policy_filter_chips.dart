import 'package:flutter/material.dart';

class PolicyFilterChips extends StatelessWidget {
  const PolicyFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 8, children: const [Chip(label: Text('전체')), Chip(label: Text('지원금')), Chip(label: Text('주거'))]);
  }
}
