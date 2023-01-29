import 'package:flutter/material.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/genre_model.dart';

import 'genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
      },
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenreModel>((genre) => GenreModel.fromMap(genre))
              .toList();
        }
        return <GenreModel>[];
      },
    );
    if (result.hasError) {
      debugPrint('Status: ${result.statusText}');
      throw Exception('Erro ao buscar Categorias');
    }
    return result.body ?? <GenreModel>[];
  }
}
