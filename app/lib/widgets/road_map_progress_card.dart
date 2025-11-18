import 'package:flutter/material.dart';

import '../model/road_map_item.dart';

class RoadMapItemCard extends StatelessWidget {
  final RoadMapItem item;

  const RoadMapItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '새싹 로드맵 ${item.id} 🌱',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        RoadmapProgressCard(
          num: item.id,
          totalPolicies: item.totalPolicies,
          completedPolicies: item.completedPolicies,
          plannedCount: item.plannedCount,
          inProgressCount: item.inProgressCount,
          doneCount: item.doneCount,
          receivedBenefits: item.receivedBenefits,
        )
      ],
    );
  }
}

class RoadmapProgressCard extends StatelessWidget {
  final int totalPolicies;
  final int completedPolicies;
  final int plannedCount;
  final int inProgressCount;
  final int doneCount;
  final int receivedBenefits;
  final int num;

  const RoadmapProgressCard({
    super.key,
    required this.totalPolicies,
    required this.completedPolicies,
    required this.plannedCount,
    required this.inProgressCount,
    required this.doneCount,
    required this.receivedBenefits,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    final double progress =
    totalPolicies == 0 ? 0 : completedPolicies / totalPolicies;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== 상단 타이틀 + 내가 받은 혜택 =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '진행 현황',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  const Text(
                    '내가 받은 혜택',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.local_activity_outlined,
                    size: 14,
                    color: Color(0xFF4B5563),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$receivedBenefits',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            '총 $totalPolicies개의 정책 중 $completedPolicies개 완료',
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF9CA3AF),
            ),
          ),

          const SizedBox(height: 12),

          // ===== 진행 바 =====
          Container(
            height: 6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress.clamp(0, 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF4C6FFF),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ===== 하단 3개 지표 =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProgressStat(number: plannedCount, label: '예정'),
              ProgressStat(number: inProgressCount, label: '진행중'),
              ProgressStat(number: doneCount, label: '완료'),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressStat extends StatelessWidget {
  final int number;
  final String label;

  const ProgressStat({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$number',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}
