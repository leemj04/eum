import 'package:flutter/material.dart';

class RoadmapProgressBar extends StatelessWidget {
  final double progress;
  const RoadmapProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(value: progress);
  }
}

