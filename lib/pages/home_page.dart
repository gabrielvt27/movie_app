import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movies_controller.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MoviesController _controller = MoviesController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Movies?>(
        valueListenable: _controller.movies,
        builder: (context, movies, child) {
          return movies != null
              ? ListView.builder(
                  itemCount: movies.listMovie.length,
                  itemBuilder: (_, index) {
                    return Text(movies.listMovie[index].title);
                  },
                )
              : Container();
        },
      ),
    );
  }
}
