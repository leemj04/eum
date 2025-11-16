// 캘린더 이벤트 관련 API 통신을 담당하는 클래스입니다.

abstract class CalendarRemoteDataSource {
  Future<void> getEvents();
  Future<void> addEvent();
}

class CalendarRemoteDataSourceImpl implements CalendarRemoteDataSource {
  @override
  Future<void> getEvents() async {
    // TODO: 캘린더 이벤트 목록 조회 API 호출 로직 구현
  }

  @override
  Future<void> addEvent() async {
    // TODO: 캘린더 이벤트 추가 API 호출 로직 구현
  }
}
