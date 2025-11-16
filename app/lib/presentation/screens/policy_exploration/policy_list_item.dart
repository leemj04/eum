import 'package:flutter/material.dart';

class PolicyListItem extends StatelessWidget {
  const PolicyListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(title: Text('정책 제목'), subtitle: Text('요약 설명'));
  }
}
