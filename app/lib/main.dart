import 'package:eum/page/home/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeDateFormatting('ko_KR', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '청년정책 로드맵',
      theme: ThemeData.light(),
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      home: HomePage()
    );
  }
}
