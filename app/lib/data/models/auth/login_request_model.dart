// 로그인 API 요청 시 서버에 보낼 데이터를 담는 모델입니다.

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  // LoginRequestModel -> JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
