import 'package:flutter/material.dart';
import 'package:eum/presentation/widgets/chat/chat_message_bubble.dart';
import 'package:eum/presentation/widgets/chat/chat_input_field.dart';

class ChatScreenImpl extends StatelessWidget {
  const ChatScreenImpl({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('채팅 - 구현')),
      body: Column(children: [Expanded(child: ListView(children: const [ChatMessageBubble(message: '예시 메세지', isMine: false), ChatMessageBubble(message: '나의 메세지', isMine: true)],)), ChatInputField(controller: controller, onSend: () {})]),
    );
  }
}
