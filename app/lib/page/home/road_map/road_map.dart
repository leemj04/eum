import 'package:eum/page/home/road_map/road_map_controller.dart';
import 'package:flutter/material.dart';

import '../../../widgets/road_map_progress_card.dart';

class RoadMapPage extends StatelessWidget {
  const RoadMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RoadMapController()..loadDummy();

    return SafeArea(
      top: false,
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 타이틀
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'AI 로드맵',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'AI가 추천하는 맞춤형 정책 로드맵',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.map_outlined, size: 32),
              ],
            ),

            const SizedBox(height: 24),

            // ===== 여기서 리스트 반복 =====
            for (final item in controller.items) ...[
              RoadMapItemCard(item: item),
              const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
