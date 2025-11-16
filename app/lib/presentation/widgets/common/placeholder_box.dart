import 'package:flutter/material.dart';

class PlaceholderBox extends StatelessWidget {
  final String label;
  const PlaceholderBox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: Colors.grey)), child: Text(label));
  }
}
