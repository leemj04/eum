import 'package:eum/constant/test_data.dart';
import 'package:eum/page/dash_board/policy_popup/policy_popup.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_bar.dart';
import '../../widgets/greeting_card.dart';
import '../../widgets/policy_card.dart';
import '../../widgets/section_header.dart';
import '../../widgets/top_bar.dart';

/// AI 추천 탭의 전체 화면 레이아웃만 담당하는 위젯
class DashBoard extends StatelessWidget {

  const DashBoard({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GreetingCard(
                      userName: testUserName,
                      userTag: testUserTag,
                    ),
                    const SizedBox(height: 24),
                    const SectionHeader(),
                    const SizedBox(height: 12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final policy = testPolicies[index];
                        return PolicyCard(
                          policy: policy,
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (_) => PolicyDetailDialog(
                                title: policy.title,     // 너의 모델에 맞게 값 전달
                                deadline: policy.deadline,
                                summary: policy.summary,
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (_, __) =>
                      const SizedBox(height: 10),
                      itemCount: testPolicies.length,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ), bottomNavigationBar: BottomBar(currentIndex: 0, onTap: (index) {})
    );
  }
}

/// 상단 앱바
class _TopAppBar extends StatelessWidget {
  const _TopAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 12),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 2),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'ㄷ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                '이음',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}