import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widgets/movies_filters.dart';
import 'widgets/movies_group.dart';
import 'widgets/movies_header.dart';

class MoviesPage extends StatelessWidget {

  const MoviesPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: ListView(
        children: const [
          MoviesHeader(),
          MoviesFilters(),
          MoviesGroup(title: 'Mais Populares'),
          MoviesGroup(title: 'Top Filmes'),
        ],
      ),
    );
  }
}
