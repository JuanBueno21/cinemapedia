import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {

  static const name = "home-screen" ;

  final Widget childView;

  const HomeScreens({
    super.key,
    required this.childView
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

