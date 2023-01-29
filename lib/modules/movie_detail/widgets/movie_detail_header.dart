import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app_filmes/modules/movie_detail/movie_detail_controller.dart';
import 'package:app_filmes/models/movie_detail_model.dart';

class MovieDetailHeader extends GetView<MovieDetailController> {
  const MovieDetailHeader({
    super.key,
    required this.movie,
  });

  final MovieDetailModel? movie;

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie!.urlImages.length,
          itemBuilder: (context, index) {
            final image = movie!.urlImages[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
