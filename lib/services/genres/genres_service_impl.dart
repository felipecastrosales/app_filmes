import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';
import 'genres_service.dart';

class GenresServiceImpl implements GenresService {
  GenresServiceImpl({
    required GenresRepository genreRepository,
  }) : _genreRepository = genreRepository;

  final GenresRepository _genreRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genreRepository.getGenres();
}
