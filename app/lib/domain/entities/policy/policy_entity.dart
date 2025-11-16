// UI 레이어 및 비즈니스 로직에서 사용될 순수한 정책 객체입니다.

class PolicyEntity {
  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime applicationStartDate;
  final DateTime applicationEndDate;

  PolicyEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.applicationStartDate,
    required this.applicationEndDate,
  });
}
