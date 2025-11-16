// 백엔드 API의 공통적인 응답 구조를 위한 모델입니다.
// (예: { "status": "success", "data": {...} })

class ApiResponseModel<T> {
  final String status;
  final T? data;
  final String? message;

  ApiResponseModel({
    required this.status,
    this.data,
    this.message,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) {
    return ApiResponseModel(
      status: json['status'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'],
    );
  }
}
