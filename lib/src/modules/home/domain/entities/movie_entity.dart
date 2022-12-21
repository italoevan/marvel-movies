class MovieEntity {
  final bool adult;
  final String image;
  final String title;
  final String originalTitle;
  final int id;
  final String overview;
  final String language;
  final double voteAverage;
  final int voteCount;

  const MovieEntity({
    required this.adult,
    required this.image,
    required this.title,
    required this.id,
    required this.overview,
    required this.language,
    required this.originalTitle,
    required this.voteAverage,
    required this.voteCount,
  });
}
