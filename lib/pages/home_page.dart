import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/controllers/movies_controller.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';
import 'package:movie_app/widgets/custom_list_card_widget.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (context, movies, child) {
                  return Visibility(
                    visible: movies != null,
                    child: Text(
                      'Movies',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  );
                },
              ),
              TextField(
                onChanged: _controller.onChanged,
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (context, movies, child) {
                  return movies != null
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: movies.listMovie.length,
                          itemBuilder: (_, index) => CustomListCardWidget(
                            movie: movies.listMovie[index],
                          ),
                          separatorBuilder: (_, __) => const Divider(),
                        )
                      : LottieBuilder.asset('assets/loading.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
