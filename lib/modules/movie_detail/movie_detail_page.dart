import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'movie_detail_controller.dart';
import 'movie_detail_content/movie_detail_content.dart';
import 'widgets/movie_detail_header.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailHeader(
                movie: controller.movie.value,
              ),
              MovieDetailContent(
                movie: controller.movie.value,
              ),
            ],
          );
        }),
      ),
    );
  }
}
