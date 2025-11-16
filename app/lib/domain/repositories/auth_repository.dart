// 인증 관련 데이터 작업을 위한 인터페이스(계약)입니다.
// 데이터 레이어의 AuthRepositoryImpl이 이 클래스를 구현합니다.

abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password, String name);
  Future<void> getUser();
}
