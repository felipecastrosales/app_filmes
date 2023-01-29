import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app_filmes/application/ui/widgets/movie_card.dart';
import 'favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map(
                    (movie) => MovieCard(
                      movie: movie,
                      favoriteCallback: () =>
                          controller.removeFavorite(movie: movie),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
