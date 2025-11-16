// 로드맵 관련 API 통신을 담당하는 클래스입니다.

abstract class RoadmapRemoteDataSource {
  Future<void> getRoadmaps();
  Future<void> createRoadmap(String title);
}

class RoadmapRemoteDataSourceImpl implements RoadmapRemoteDataSource {
  @override
  Future<void> getRoadmaps() async {
    // TODO: 로드맵 목록 조회 API 호출 로직 구현
  }

  @override
  Future<void> createRoadmap(String title) async {
    // TODO: 로드맵 생성 API 호출 로직 구현
  }
}
