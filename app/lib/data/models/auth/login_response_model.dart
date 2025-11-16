// 로그인 API 응답 데이터를 담는 모델입니다.

class LoginResponseModel {
  final String token;
  // final UserModel user; // 사용자 정보가 함께 오는 경우

  LoginResponseModel({
    required this.token,
    // required this.user,
  });

  // JSON -> LoginResponseModel
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      // user: UserModel.fromJson(json['user']),
    );
  }
}
