// UI 레이어 및 비즈니스 로직에서 사용될 순수한 로드맵 블록 객체입니다.

class RoadmapBlockEntity {
  final String id;
  final String type; // 'policy' or 'custom'
  final String title;
  final String description;
  final DateTime date;
  final String? policyId;

  RoadmapBlockEntity({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.date,
    this.policyId,
  });
}
