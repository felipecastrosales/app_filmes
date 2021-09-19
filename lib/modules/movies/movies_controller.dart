import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/services/genres/genres_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];
  final genreSelected = Rxn<GenreModel>();

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
  })  : _genresService = genresService,
        _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);

      final popularMoviesData = await _moviesService.getPopularMovies();
      final topRatedMoviesData = await _moviesService.getTopRatedMovies();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;
      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;
    } catch (e, s) {
      print(e);
      print(s);
      _message(
        MessageModel.error(
          title: 'Erro',
          message: 'Erro ao carregar os dados da Página',
        ),
      );
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where(
        (movie) {
          return movie.title.toLowerCase().contains(
                title.toLowerCase(),
              );
        },
      );
      var newTopRatedMovies = _topRatedMoviesOriginal.where(
        (movie) {
          return movie.title.toLowerCase().contains(
                title.toLowerCase(),
              );
        },
      );
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    if (genreModel?.id == genreSelected.value?.id) {
      genreModel = null;
    }

    genreSelected.value = genreModel;

    if (genreModel != null) {
      var newPopularMovies = _popularMoviesOriginal.where(
        (movie) {
          return movie.genres.contains(genreModel?.id);
        },
      );
      var newTopRatedMovies = _topRatedMoviesOriginal.where(
        (movie) {
          return movie.genres.contains(genreModel?.id);
        },
      );
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }
}
