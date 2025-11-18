import 'package:flutter/material.dart';
import '../model/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == Sender.user;

    final bubbleColor = isUser
        ? const Color(0xFFF6E6D9)
        : const Color(0xFFE5E7EB);

    final align = isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final mainAxisAlign =
    isUser ? MainAxisAlignment.end : MainAxisAlignment.start;

    return Column(
      crossAxisAlignment: align,
      children: [
        if (!isUser)
          Row(
            mainAxisAlignment: mainAxisAlign,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFF4C6FFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'ㄷ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                '이음',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

        if (!isUser) const SizedBox(height: 6),

        Row(
          mainAxisAlignment: mainAxisAlign,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: bubbleColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: Radius.circular(isUser ? 12 : 2),
                    bottomRight: Radius.circular(isUser ? 2 : 12),
                  ),
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    fontSize: 13,
                    color: isUser ? Colors.black : Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),
        Text(
          message.time,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class ChatDateDivider extends StatelessWidget {
  final String text;

  const ChatDateDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ),
        const Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}
