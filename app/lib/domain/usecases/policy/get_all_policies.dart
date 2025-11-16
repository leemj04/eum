// 간단한 정책 조회 유스케이스 템플릿

class GetAllPolicies {
  const GetAllPolicies();

  Future<void> call() async {
    // TODO: PolicyRepository에서 정책 목록 조회
    await Future.delayed(const Duration(milliseconds: 300));
  }
}

