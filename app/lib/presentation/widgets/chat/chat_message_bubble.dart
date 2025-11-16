import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  final String message;
  final bool isMine;
  const ChatMessageBubble({super.key, required this.message, this.isMine = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(padding: const EdgeInsets.all(8), margin: const EdgeInsets.all(6), decoration: BoxDecoration(color: isMine ? Colors.blue[200] : Colors.grey[200], borderRadius: BorderRadius.circular(8)), child: Text(message)),
    );
  }
}
