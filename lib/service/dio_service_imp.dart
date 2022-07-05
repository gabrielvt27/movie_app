import 'package:dio/dio.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization': 'Bearer ${Constants.apiToken}'
        },
      ),
    );
  }
}
