// 정책 관련 데이터 작업을 위한 인터페이스입니다.

abstract class PolicyRepository {
  Future<void> getPolicies();
  Future<void> getPolicyById(String id);
}
