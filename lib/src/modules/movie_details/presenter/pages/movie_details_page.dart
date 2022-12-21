import 'package:flutter/material.dart';
import 'package:gen/src/consts/app_images.dart';
import 'package:gen/src/modules/home/domain/entities/movie_entity.dart';
import 'package:gen/src/modules/movie_details/presenter/widgets/rate_widget.dart';
import 'package:gen/src/shared/presenter/widgets/generic_app_bar.dart';
import 'package:gen/src/shared/presenter/widgets/movie_poster.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieEntity movie;
  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: GenericAppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AppImages.homeBackground,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.transparent,
                    Colors.black,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MoviePoster(image: AppImages.posterImage),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  Text(
                                    movie.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    movie.overview,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RateWidget(value: movie.voteAverage),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Titulo Original",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          movie.originalTitle,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
