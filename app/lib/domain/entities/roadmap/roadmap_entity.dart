import 'package:eum/domain/entities/roadmap/roadmap_block_entity.dart';

// UI 레이어 및 비즈니스 로직에서 사용될 순수한 로드맵 객체입니다.

class RoadmapEntity {
  final String id;
  final String title;
  final List<RoadmapBlockEntity> blocks;

  RoadmapEntity({
    required this.id,
    required this.title,
    required this.blocks,
  });
}
