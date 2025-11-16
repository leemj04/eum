// 정책 정보 관련 API 통신을 담당하는 클래스입니다.

abstract class PolicyRemoteDataSource {
  Future<void> getPolicies();
  Future<void> getPolicyById(String id);
}

class PolicyRemoteDataSourceImpl implements PolicyRemoteDataSource {
  @override
  Future<void> getPolicies() async {
    // TODO: 정책 목록 조회 API 호출 로직 구현
  }

  @override
  Future<void> getPolicyById(String id) async {
    // TODO: 정책 상세 정보 조회 API 호출 로직 구현
  }
}
