import 'package:eum/domain/entities/chat/chat_message_entity.dart';

// UI 레이어 및 비즈니스 로직에서 사용될 순수한 채팅 세션 객체입니다.

class ChatSessionEntity {
  final String id;
  final String title;
  final List<ChatMessageEntity> messages;
  final DateTime lastMessageTimestamp;

  ChatSessionEntity({
    required this.id,
    required this.title,
    required this.messages,
    required this.lastMessageTimestamp,
  });
}
