import 'package:coffee_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'IBM'),
    );
  }
}
