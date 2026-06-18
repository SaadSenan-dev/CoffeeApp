import 'package:coffee_app/features/home/presentation/widgets/appbody/app_body.dart';
import 'package:coffee_app/features/home/presentation/widgets/sidebar/side_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      body: AppBody(),
    );
  }
}
