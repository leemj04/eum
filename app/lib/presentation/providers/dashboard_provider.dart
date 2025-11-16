import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  String _status = 'idle';
  String get status => _status;

  void setStatus(String s) {
    _status = s;
    notifyListeners();
  }
}

