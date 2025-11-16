// 채팅 메시지 정보 API 응답을 파싱하기 위한 데이터 모델입니다.

class ChatMessageModel {
  final String id;
  final String text;
  final DateTime timestamp;
  final String sender; // 'user' or 'agent'

  ChatMessageModel({
    required this.id,
    required this.text,
    required this.timestamp,
    required this.sender,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'],
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']),
      sender: json['sender'],
    );
  }
}
