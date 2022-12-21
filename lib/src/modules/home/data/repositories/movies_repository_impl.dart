import 'dart:convert';

import 'package:gen/src/modules/home/data/datasources/get_movies_datasource.dart';
import 'package:gen/src/modules/home/domain/repositories/movies_repository.dart';
import 'package:gen/src/modules/home/data/models/movie_model.dart';
import 'package:gen/src/modules/home/domain/entities/movie_entity.dart';

class MoviesRepositoryImpl implements IMoviesRepository {
  final IGetMoviesDatasource getMoviesDatasource;

  const MoviesRepositoryImpl({required this.getMoviesDatasource});

  @override
  Future<List<MovieEntity>> getMovies() async {
    final response = await getMoviesDatasource();

    return json
        .decode(response)["mcu"]
        .map<MovieEntity>((v) => MovieModel.fromMap(v))
        .toList();
  }
}
