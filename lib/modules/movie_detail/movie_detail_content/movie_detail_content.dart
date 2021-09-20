import 'package:flutter/material.dart';

import 'package:app_filmes/models/movie_detail_model.dart';
import 'movie_detail_content_title.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieDetailModel? movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieDetailContentTitle(
          movie: movie,
        ),
      ],
    );
  }
}
