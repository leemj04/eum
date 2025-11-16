abstract class RoadmapRepository {
  Future<void> createRoadmap(Map<String, dynamic> payload);
  Future<void> getUserRoadmaps();
  Future<void> updateRoadmap(String id, Map<String, dynamic> patch);
  Future<void> deleteRoadmap(String id);
}

