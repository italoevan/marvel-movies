import 'package:gen/src/modules/home/domain/entities/movie_entity.dart';

abstract class IMoviesRepository {
  Future<List<MovieEntity>> getMovies();
}
