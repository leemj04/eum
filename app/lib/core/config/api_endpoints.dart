// 백엔드 API 엔드포인트를 정의합니다.
class ApiEndpoints {
  static const String baseUrl = 'http://localhost:3000/api'; // 예시 URL

  // Auth
  static const String login = '$baseUrl/auth/login';
  static const String register = '$baseUrl/auth/register';
  static const String userProfile = '$baseUrl/auth/me';

  // Policy
  static const String policies = '$baseUrl/policies';
  static String policyDetail(String id) => '$baseUrl/policies/$id';

  // Roadmap
  static const String roadmaps = '$baseUrl/roadmaps';

  // AI Recommendation
  static const String aiPolicyRecommendation = '$baseUrl/ai/recommend/policy';

  // Chat
  static const String chat = '$baseUrl/chat';
}
