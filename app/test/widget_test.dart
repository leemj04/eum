// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:eum/main.dart';

void main() {
  testWidgets('앱 위젯 스모크 테스트', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // 기본 스플래시가 표시되므로 FlutterLogo가 하나 이상 존재해야 합니다.
    expect(find.byType(FlutterLogo), findsWidgets);
  });
}
