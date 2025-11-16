// 로컬 저장소를 사용하여 정책 데이터를 캐싱하는 로직을 담당합니다.
// (자주 변경되지 않는 데이터를 저장하여 API 호출을 줄일 수 있습니다.)

abstract class PolicyCacheDataSource {
  Future<void> cachePolicies();
  Future<void> getCachedPolicies();
}

class PolicyCacheDataSourceImpl implements PolicyCacheDataSource {
  @override
  Future<void> cachePolicies() async {
    // TODO: 정책 목록을 로컬에 캐싱하는 로직 구현 (예: Hive, Isar, Drift 등)
  }

  @override
  Future<void> getCachedPolicies() async {
    // TODO: 캐싱된 정책 목록을 불러오는 로직 구현
  }
}
