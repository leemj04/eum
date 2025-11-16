// AI 기반 추천 관련 API 통신을 담당하는 클래스입니다.

abstract class AiRemoteDataSource {
  Future<void> getPolicyRecommendations(String userInput);
  Future<void> getRoadmapSuggestions(String userInput);
}

class AiRemoteDataSourceImpl implements AiRemoteDataSource {
  @override
  Future<void> getPolicyRecommendations(String userInput) async {
    // TODO: AI 정책 추천 API 호출 로직 구현
  }

  @override
  Future<void> getRoadmapSuggestions(String userInput) async {
    // TODO: AI 로드맵 제안 API 호출 로직 구현
  }
}
