
import 'package:flutter/material.dart';


class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: "Inicio"
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outlined),
          label: "Categorias"
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favoritos"
        )

      ]
    );
  }
}