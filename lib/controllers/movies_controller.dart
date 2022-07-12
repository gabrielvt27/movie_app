import 'package:flutter/widgets.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;

  MoviesController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cachedMovies;

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.listMovie
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    movies.value = movies.value!.copyWith(listMovie: list);
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
