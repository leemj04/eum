import 'package:flutter/material.dart';
import 'package:eum/core/routes/app_router.dart';
import 'package:eum/core/routes/route_paths.dart';

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
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RoutePaths.splash,
    );
  }
}
