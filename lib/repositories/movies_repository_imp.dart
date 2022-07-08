import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'package:movie_app/service/dio_service.dart';
import 'package:movie_app/utils/api.utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    final result = await _dioService.getDio().get(Api.requestMovieList);

    return Movies.fromJson(result.data);
  }
}
