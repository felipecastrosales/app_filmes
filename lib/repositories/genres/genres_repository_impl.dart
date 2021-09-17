import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movies/list',
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenreModel>(
                (genre) => GenreModel.fromMap(genre),
              )
              .toList();
        }
        return <GenreModel>[];
      },
    );
    if (result.hasError) {
      print(result.statusText);
      throw Exception('Erro ao buscar Genres');
    }
    return result.body ?? <GenreModel>[];
  }
}
