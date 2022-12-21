import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen/src/consts/app_images.dart';
import 'package:gen/src/consts/routes/app_routes.dart';

import 'package:gen/src/modules/home/domain/entities/movie_entity.dart';
import 'package:gen/src/shared/presenter/widgets/movie_poster.dart';

class MovieItem extends StatelessWidget {
  final MovieEntity movie;

  const MovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: GestureDetector(
        onTap: () {
          Modular.to
              .pushNamed(AppRoutes.movieDetails, arguments: {"movie": movie});
        },
        child: Column(
          children: [
            MoviePoster(image: AppImages.posterImage),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                movie.title,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
