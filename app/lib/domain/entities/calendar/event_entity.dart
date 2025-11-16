// UI 레이어 및 비즈니스 로직에서 사용될 순수한 캘린더 이벤트 객체입니다.

class EventEntity {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String type;

  EventEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
  });
}
