class UpdateRoadmap {
  const UpdateRoadmap();

  Future<void> call(String roadmapId, Map<String, dynamic> patch) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}

