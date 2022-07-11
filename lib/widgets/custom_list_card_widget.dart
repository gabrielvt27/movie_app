import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/utils/api.utils.dart';

class CustomListCardWidget extends StatelessWidget {
  const CustomListCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: Image.network(
              Api.requestImg(movie.posterPath),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return const CircularProgressIndicator.adaptive();
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline6,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const Spacer(),
                  Text('Popularidade: ${movie.popularity.toString()}'),
                  const SizedBox(height: 10),
                  Text('Votos: ${movie.voteAverage.toString()}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
