import 'package:cinemapedia/config/constants/environtment.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {

  static const name = "home-screen" ;
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text( Environtment.movieDbKey ),
      ),
    );
  }
}