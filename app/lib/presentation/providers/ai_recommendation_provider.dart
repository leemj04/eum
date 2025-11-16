import 'package:flutter/material.dart';

class AiRecommendationProvider with ChangeNotifier {
  List<dynamic> _recommendations = [];
  List<dynamic> get recommendations => _recommendations;

  void setRecommendations(List<dynamic> items) {
    _recommendations = items;
    notifyListeners();
  }
}

