class SendChatMessage {
  const SendChatMessage();

  Future<void> call(String sessionId, String message) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}

