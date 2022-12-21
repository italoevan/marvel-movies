import 'package:gen/src/modules/home/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel._({
    required super.adult,
    required super.image,
    required super.title,
    required super.id,
    required super.language,
    required super.voteAverage,
    required super.voteCount,
    required super.overview,
    required super.originalTitle,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel._(
        adult: map["adult"],
        image: map["poster_path"],
        title: map["title"],
        overview: map["overview"],
        originalTitle: map["original_title"],
        id: map["id"],
        language: map["original_language"],
        voteAverage: map["vote_average"],
        voteCount: map["vote_count"]);
  }
}
