import 'package:flutter/material.dart';

class ChatSessionListScreen extends StatelessWidget {
  const ChatSessionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('채팅 세션 목록')),
      body: const Center(child: Text('채팅 세션 목록 화면')),
    );
  }
}
