// 간단한 유스케이스 템플릿 (비동기 처리 및 예외 패턴)

class LoginUser {
  const LoginUser();

  Future<void> call(String email, String password) async {
    // TODO: AuthRepository 사용해서 실제 로그인 구현
    await Future.delayed(const Duration(milliseconds: 300));
  }
}

