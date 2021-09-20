import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;
  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: <String, String>{
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MovieModel>(
                (date) => MovieModel.fromMap(date),
              )
              .toList();
        }
        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar popular movies [${result.statusText}]');
      throw Exception('Erro ao buscar filmes populares');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: <String, String>{
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MovieModel>(
                (date) => MovieModel.fromMap(date),
              )
              .toList();
        }
        return <MovieModel>[];
      },
    );
    if (result.hasError) {
      print('Erro ao buscar top_rated movies ${result.statusText}');
      throw Exception('Erro ao buscar filmes tops');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClient.get<MovieDetailModel?>(
      '/movie/$id',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br',
      },
      decoder: (data) {
        return MovieDetailModel.fromMap(data);
      },
    );
    if (result.hasError) {
      print('Erro ao buscar detalhes dos movies ${result.statusText}');
      throw Exception('Erro ao buscar detalhes dos filmes');
    }
    return result.body;
  }
}
