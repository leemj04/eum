class GetChatHistory {
  const GetChatHistory();

  Future<void> call(String sessionId) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}

