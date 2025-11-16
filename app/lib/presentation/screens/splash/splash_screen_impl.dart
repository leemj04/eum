import 'package:flutter/material.dart';

class SplashScreenImpl extends StatelessWidget {
  const SplashScreenImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FlutterLogo(size: 120)));
  }
}
