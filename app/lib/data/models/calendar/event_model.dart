// 캘린더 이벤트 정보 API 응답을 파싱하기 위한 데이터 모델입니다.

class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String type; // 예: 'policy_deadline', 'custom'

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'type': type,
    };
  }
}
