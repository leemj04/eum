abstract class ChatRepository {
  Future<void> sendMessage(String sessionId, String message);
  Future<void> getHistory(String sessionId);
}

