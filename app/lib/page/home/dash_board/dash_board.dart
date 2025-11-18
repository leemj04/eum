import 'package:eum/constant/test_data.dart';
import 'package:flutter/material.dart';

import '../../../widgets/policy_card.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/greeting_card.dart';
import './policy_popup/policy_popup.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GreetingCard(
                userName: testUserName,
                userTag: testUserTag,
              ),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SectionHeader(),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: testPolicies.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final policy = testPolicies[index];
                  return PolicyCard(
                    policy: policy,
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (_) => PolicyDetailDialog(
                          title: policy.title,
                          deadline: policy.deadline,
                          summary: policy.summary,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
