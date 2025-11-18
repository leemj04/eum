import 'package:eum/page/dash_board/dash_board.dart';
import 'package:eum/widgets/policy_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '청년정책 로드맵',
      theme: ThemeData.light(),
      home: DashBoard()
    );
  }
}
