// 예외(Exception)를 UI 레이어에 전달하기 위한 추상화된 실패(Failure) 객체를 정의합니다.
// 이를 통해 UI는 특정 예외에 대해 알 필요 없이 실패 상황에 대처할 수 있습니다.

abstract class Failure {
  final String message;
  const Failure({required this.message});
}

// 서버 통신 실패
class ServerFailure extends Failure {
  const ServerFailure({super.message = '서버 오류가 발생했습니다.'});
}

// 로컬 캐시 실패
class CacheFailure extends Failure {
  const CacheFailure({super.message = '로컬 데이터 처리 중 오류가 발생했습니다.'});
}

// 네트워크 연결 실패
class NetworkFailure extends Failure {
  const NetworkFailure({super.message = '네트워크 연결을 확인해주세요.'});
}
