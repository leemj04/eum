import 'package:flutter/material.dart';

class CalendarProvider with ChangeNotifier {
  List<dynamic> _events = [];
  List<dynamic> get events => _events;

  void setEvents(List<dynamic> items) {
    _events = items;
    notifyListeners();
  }
}

