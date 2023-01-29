import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'filter_tag.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() {
          return Row(
            children: controller.genres
                .map(
                  (genre) => FilterTag(
                    model: genre,
                    onPressed: () => controller.filterMoviesByGenre(genre),
                    selected: controller.genreSelected.value?.id == genre.id,
                  ),
                )
                .toList(),
          );
        }),
      ),
    );
  }
}
