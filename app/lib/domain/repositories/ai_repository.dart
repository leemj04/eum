abstract class AiRepository {
  Future<void> getPolicyRecommendations(String context);
  Future<void> getRoadmapSuggestions(String context);
}

