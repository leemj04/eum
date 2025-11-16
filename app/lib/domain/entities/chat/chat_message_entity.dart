// UI 레이어 및 비즈니스 로직에서 사용될 순수한 채팅 메시지 객체입니다.

class ChatMessageEntity {
  final String id;
  final String text;
  final DateTime timestamp;
  final String sender; // 'user' or 'agent'

  ChatMessageEntity({
    required this.id,
    required this.text,
    required this.timestamp,
    required this.sender,
  });
}
