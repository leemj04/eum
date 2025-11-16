// 인증 관련 API 통신을 담당하는 클래스입니다.
// (로그인, 회원가입, 사용자 정보 조회 등)

// TODO: http 패키지 import 추가
// import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password, String name);
  Future<void> getUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // final http.Client client;
  // AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<void> login(String email, String password) async {
    // TODO: 로그인 API 호출 로직 구현
    // final response = await client.post(...);
    // ...
  }

  @override
  Future<void> register(String email, String password, String name) async {
    // TODO: 회원가입 API 호출 로직 구현
  }

  @override
  Future<void> getUser() async {
    // TODO: 사용자 정보 조회 API 호출 로직 구현
  }
}
