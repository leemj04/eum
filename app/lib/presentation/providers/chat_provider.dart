import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final List<dynamic> _messages = [];
  List<dynamic> get messages => _messages;

  void addMessage(dynamic m) {
    _messages.add(m);
    notifyListeners();
  }
}
