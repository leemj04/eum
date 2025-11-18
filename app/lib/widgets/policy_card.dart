import 'package:flutter/material.dart';
import '../model/policy_data.dart';

class PolicyCard extends StatelessWidget {
  final PolicyViewData policy;
  final VoidCallback? onTap;

  const PolicyCard({
    super.key,
    required this.policy,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(14);

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,                 // 👈 여기서 탭 이벤트 처리
        borderRadius: borderRadius,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(0.03),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(child: _PolicyMain(policy: policy)),
              const SizedBox(width: 8),
              _PolicySide(matchRate: policy.matchRate),
            ],
          ),
        ),
      ),
    );
  }
}

class _PolicyMain extends StatelessWidget {
  final PolicyViewData policy;

  const _PolicyMain({required this.policy});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                policy.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            if (policy.isUrgent)
              const Text(
                '마감 임박',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE3E5FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                policy.category,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4C6FFF),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.event_note, size: 14, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              policy.deadline,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          policy.description,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class _PolicySide extends StatelessWidget {
  final int matchRate;

  const _PolicySide({required this.matchRate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.bookmark_border, size: 20),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        Text(
          '$matchRate%',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        ),
        const Text(
          '적합도',
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}
