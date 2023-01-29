import 'dart:convert';

import 'package:app_filmes/models/genre_model.dart';
import 'cast_model.dart';

class MovieDetailModel {
  MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPoster = map['images']['posters'];
    var urlImages = urlImagesPoster
            ?.map<String>((images) =>
                'https://image.tmdb.org/t/p/w200${images['file_path']}')
            .toList() ??
        const [];

    return MovieDetailModel(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? 0.0,
      genres: List<GenreModel>.from(
        map['genres']?.map(
              (genre) => GenreModel.fromMap(genre),
            ) ??
            const [],
      ),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies: List<dynamic>.from(
        map['production_companies'] ?? const [],
      ).map<String>((production) => production['name']).toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from(
        map['credits']['cast']?.map((credit) => CastModel.fromMap(credit)) ??
            const [],
      ),
    );
  }

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source));

  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'vote_average': stars,
      'genres': genres.map((genre) => genre.toMap()).toList(),
      'urlImages': urlImages,
      'release_date': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'production_companies': productionCompanies,
      'original_language': originalLanguage,
      'cast': cast.map((item) => item.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
