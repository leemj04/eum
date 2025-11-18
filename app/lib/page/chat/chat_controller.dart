import '../../constant/test_data.dart';
import '../../model/chat_message.dart';

class ChatController {
  /// 실제로 화면에 쓸 메시지 리스트
  final List<ChatMessage> messages;

  ChatController({List<ChatMessage>? initial})
      : messages = initial ?? List.from(testMessages);

  void handleUserSend(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    final now = _currentTimeString();

    messages.add(
      ChatMessage(
        sender: Sender.user,
        text: trimmed,
        time: now,
      ),
    );

    messages.add(
      ChatMessage(
        sender: Sender.bot,
        text: '아직 챗봇 기능은 제공하지 않습니다',
        time: now,
      ),
    );
  }

  String _currentTimeString() {
    final now = DateTime.now();
    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
