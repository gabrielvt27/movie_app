import 'package:flutter/widgets.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;

  MoviesController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
  }
}
