// 정책 카테고리 정보 API 응답을 파싱하기 위한 데이터 모델입니다.

class PolicyCategoryModel {
  final String id;
  final String name;

  PolicyCategoryModel({
    required this.id,
    required this.name,
  });

  factory PolicyCategoryModel.fromJson(Map<String, dynamic> json) {
    return PolicyCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
