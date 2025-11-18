// lib/page/home/home.dart
import 'package:flutter/material.dart';

import '../../widgets/bottom_bar.dart';
import '../../widgets/top_bar.dart';
import '../home/dash_board/dash_board.dart';
import 'find_policy/find_policy.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTapBottomNav(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 각 탭에 대응하는 화면들
    final List<Widget> pages = [
      const DashBoard(),
      const Center(child: Text('로드맵 페이지')),      // 1: 로드맵 (TODO 교체)
      const Center(child: Text('AI 추천 페이지')),     // 2: AI 추천 (TODO 교체)
      const FindPolicyPage(),
      const Center(child: Text('캘린더 페이지')),      // 4: 캘린더 (TODO 교체)
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(height: 12),

            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: pages,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTap: _onTapBottomNav,
      ),
    );
  }
}