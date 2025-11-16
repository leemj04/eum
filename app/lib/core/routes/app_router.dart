import 'package:flutter/material.dart';

// 추가된 화면 import
import 'package:eum/presentation/screens/splash/splash_screen.dart';
import 'package:eum/presentation/screens/auth/login_screen.dart';
import 'package:eum/presentation/screens/main_nav_wrapper.dart';
import 'package:eum/presentation/screens/policy_exploration/policy_exploration_screen.dart';
import 'package:eum/presentation/screens/policy_exploration/policy_detail_screen.dart';
import 'package:eum/presentation/screens/chat/chat_screen.dart';

import 'package:eum/core/routes/route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutePaths.mainNav:
        return MaterialPageRoute(builder: (_) => const MainNavWrapper());
      case RoutePaths.policyExploration:
        return MaterialPageRoute(builder: (_) => const PolicyExplorationScreen());
      case RoutePaths.policyDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        final id = args != null ? args['id'] as String? : null;
        return MaterialPageRoute(builder: (_) => PolicyDetailScreen(key: ValueKey(id)));
      case RoutePaths.chat:
        return MaterialPageRoute(builder: (_) => const ChatScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
