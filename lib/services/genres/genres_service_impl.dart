import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';
import 'genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genreRepository;

  GenresServiceImpl({
    required GenresRepository genreRepository,
  }) : _genreRepository = genreRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genreRepository.getGenres();
}
