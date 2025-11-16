import 'package:eum/data/models/roadmap/roadmap_block_model.dart';

// 로드맵 정보 API 응답을 파싱하기 위한 데이터 모델입니다.

class RoadmapModel {
  final String id;
  final String title;
  final List<RoadmapBlockModel> blocks;

  RoadmapModel({
    required this.id,
    required this.title,
    required this.blocks,
  });

  factory RoadmapModel.fromJson(Map<String, dynamic> json) {
    return RoadmapModel(
      id: json['id'],
      title: json['title'],
      blocks: (json['blocks'] as List)
          .map((item) => RoadmapBlockModel.fromJson(item))
          .toList(),
    );
  }
}
