// 채팅 관련 API 통신을 담당하는 클래스입니다.

abstract class ChatRemoteDataSource {
  Future<void> sendMessage(String message);
  Future<void> getChatHistory();
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  @override
  Future<void> sendMessage(String message) async {
    // TODO: 채팅 메시지 전송 API 호출 로-직 구현
  }

  @override
  Future<void> getChatHistory() async {
    // TODO: 채팅 내역 조회 API 호출 로직 구현
  }
}
