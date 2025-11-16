import 'package:eum/data/models/policy/policy_model.dart';

// 정책 목록 API 응답 전체를 담는 모델입니다. (페이징 정보 포함 가능)
class PolicyListResponseModel {
  final List<PolicyModel> policies;
  // final int totalCount;
  // final int currentPage;

  PolicyListResponseModel({
    required this.policies,
    // required this.totalCount,
    // required this.currentPage,
  });

  factory PolicyListResponseModel.fromJson(Map<String, dynamic> json) {
    return PolicyListResponseModel(
      policies: (json['policies'] as List)
          .map((item) => PolicyModel.fromJson(item))
          .toList(),
      // totalCount: json['totalCount'],
      // currentPage: json['currentPage'],
    );
  }
}
