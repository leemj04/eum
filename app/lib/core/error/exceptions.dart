// 애플리케이션에서 발생할 수 있는 커스텀 예외를 정의합니다.

// API 통신 중 발생하는 예외
class ServerException implements Exception {
  final String message;
  ServerException({this.message = '서버와 통신 중 오류가 발생했습니다.'});
}

// 로컬 데이터 처리 중 발생하는 예외
class CacheException implements Exception {
  final String message;
  CacheException({this.message = '데이터를 로컬에 저장하는 중 오류가 발생했습니다.'});
}

// 인증 관련 예외
class AuthException implements Exception {
  final String message;
  AuthException({this.message = '인증에 실패했습니다.'});
}
