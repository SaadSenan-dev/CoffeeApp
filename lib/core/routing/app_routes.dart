import 'package:coffee_app/features/auth/presentation/login/login_screen.dart';
import 'package:coffee_app/features/auth/presentation/register/register_screen.dart';
import 'package:coffee_app/features/home/data/coffee_data.dart';
import 'package:coffee_app/features/home/presentation/screens/details_screen.dart';
import 'package:coffee_app/features/home/presentation/screens/home_screen.dart';
import 'package:coffee_app/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String home = "/home";
  static const String details = "/details";
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case AppRoutes.details:
        final coffee = settings.arguments as Coffee;

        return MaterialPageRoute(
          builder: (_) => DetailsScreen(coffee: coffee),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Route not found"),
            ),
          ),
        );
    }
  }
}
