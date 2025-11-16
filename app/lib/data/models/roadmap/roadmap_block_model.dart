// 로드맵을 구성하는 개별 블록(정책 또는 사용자 정의 단계)의 데이터 모델입니다.

class RoadmapBlockModel {
  final String id;
  final String type; // 'policy' or 'custom'
  final String title;
  final String description;
  final DateTime date;
  final String? policyId; // 'policy' 타입일 경우 정책 ID

  RoadmapBlockModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.date,
    this.policyId,
  });

  factory RoadmapBlockModel.fromJson(Map<String, dynamic> json) {
    return RoadmapBlockModel(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      policyId: json['policyId'],
    );
  }
}
