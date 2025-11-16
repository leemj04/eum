import 'package:eum/data/models/chat/chat_message_model.dart';

// 채팅 세션(대화 목록) 정보 API 응답을 파싱하기 위한 데이터 모델입니다.

class ChatSessionModel {
  final String id;
  final String title;
  final List<ChatMessageModel> messages;
  final DateTime lastMessageTimestamp;

  ChatSessionModel({
    required this.id,
    required this.title,
    required this.messages,
    required this.lastMessageTimestamp,
  });

  factory ChatSessionModel.fromJson(Map<String, dynamic> json) {
    return ChatSessionModel(
      id: json['id'],
      title: json['title'],
      messages: (json['messages'] as List)
          .map((item) => ChatMessageModel.fromJson(item))
          .toList(),
      lastMessageTimestamp: DateTime.parse(json['lastMessageTimestamp']),
    );
  }
}
