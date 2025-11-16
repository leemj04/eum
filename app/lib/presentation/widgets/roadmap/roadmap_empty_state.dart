import 'package:flutter/material.dart';

class RoadmapEmptyState extends StatelessWidget {
  const RoadmapEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(mainAxisSize: MainAxisSize.min, children: const [Icon(Icons.info_outline), SizedBox(height:8), Text('작성된 로드맵이 없습니다.')],));
  }
}
