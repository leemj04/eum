import 'package:flutter/material.dart';

class RoadmapProvider with ChangeNotifier {
  List<dynamic> _roadmaps = [];
  List<dynamic> get roadmaps => _roadmaps;

  void setRoadmaps(List<dynamic> items) {
    _roadmaps = items;
    notifyListeners();
  }
}

