import 'package:flutter/material.dart';
import 'package:eum/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:eum/presentation/screens/policy_exploration/policy_exploration_screen.dart';
import 'package:eum/presentation/screens/roadmap/roadmap_screen.dart';
import 'package:eum/presentation/screens/calendar/calendar_screen.dart';
import 'package:eum/presentation/screens/ai_recommendation/ai_recommendation_screen.dart';

class MainNavWrapper extends StatefulWidget {
  const MainNavWrapper({super.key});

  @override
  State<MainNavWrapper> createState() => _MainNavWrapperState();
}

class _MainNavWrapperState extends State<MainNavWrapper> {
  int _currentIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const DashboardScreen(),
    const PolicyExplorationScreen(),
    const RoadmapScreen(),
    const CalendarScreen(),
    const AIRecommendationScreen(),
  ];

  void _onTap(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '대시보드'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '정책'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: '로드맵'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: '캘린더'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'AI'),
        ],
      ),
    );
  }
}
