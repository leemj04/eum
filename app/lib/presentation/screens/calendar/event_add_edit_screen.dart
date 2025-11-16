import 'package:flutter/material.dart';

class EventAddEditScreen extends StatelessWidget {
  const EventAddEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('이벤트 추가/수정')),
      body: const Center(child: Text('이벤트 추가/수정 화면')),
    );
  }
}

