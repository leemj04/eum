// 정책 정보 API 응답을 파싱하기 위한 데이터 모델입니다.

class PolicyModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime applicationStartDate;
  final DateTime applicationEndDate;

  PolicyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.applicationStartDate,
    required this.applicationEndDate,
  });

  factory PolicyModel.fromJson(Map<String, dynamic> json) {
    return PolicyModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      applicationStartDate: DateTime.parse(json['applicationStartDate']),
      applicationEndDate: DateTime.parse(json['applicationEndDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'applicationStartDate': applicationStartDate.toIso8601String(),
      'applicationEndDate': applicationEndDate.toIso8601String(),
    };
  }
}
