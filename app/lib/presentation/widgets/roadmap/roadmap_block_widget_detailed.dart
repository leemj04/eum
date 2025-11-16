import 'package:flutter/material.dart';

class RoadmapBlockWidgetDetailed extends StatelessWidget {
  const RoadmapBlockWidgetDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('블록 제목', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height:4), Text('블록 설명')],));
  }
}
