import 'package:flutter/material.dart';

class PolicyProvider with ChangeNotifier {
  List<dynamic> _policies = [];
  List<dynamic> get policies => _policies;

  void setPolicies(List<dynamic> items) {
    _policies = items;
    notifyListeners();
  }
}

