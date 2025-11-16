import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: currentIndex, onTap: onTap, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: '대시보드'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: '정책'),
      BottomNavigationBarItem(icon: Icon(Icons.map), label: '로드맵'),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: '캘린더'),
      BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'AI'),
    ]);
  }
}
