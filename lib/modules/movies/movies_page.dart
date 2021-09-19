import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'movies_controller.dart';
import 'widgets/movies_filters.dart';
import 'widgets/movies_group.dart';
import 'widgets/movies_header.dart';
class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          const MoviesHeader(),
          const MoviesFilters(),
          MoviesGroup(
            title: 'Mais populares',
            movies: controller.popularMovies,
          ),
          MoviesGroup(
            title: 'Top Filmes',
            movies: controller.topRatedMovies,
          ),
        ],
      ),
    );
  }
}