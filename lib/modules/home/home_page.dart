import 'package:flutter/material.dart';

import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/application/ui/theme_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: context.themeRed,
        unselectedItemColor: context.themeGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Filmes',
          ),
          BottomNavigationBarItem(
            icon: Icon(FilmesAppIcons.heartEmpty),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_outlined),
            label: 'Sair',
          ),
        ],
      ),
    );
  }
}
