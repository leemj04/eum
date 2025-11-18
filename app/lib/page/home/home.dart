// lib/page/home/home.dart
import 'package:eum/page/home/road_map/road_map.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_bar.dart';
import '../../widgets/top_bar.dart';
import '../home/dash_board/dash_board.dart';
import 'calender/calender.dart';
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
      const RoadMapPage(),
      const Center(child: Text('AI 추천 페이지')),
      const FindPolicyPage(),
      const CalendarPage(),
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