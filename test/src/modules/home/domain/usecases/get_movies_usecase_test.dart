import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/src/modules/home/domain/entities/movie_entity.dart';
import 'package:gen/src/modules/home/domain/errors/empty_movie_error.dart';
import 'package:gen/src/modules/home/domain/repositories/movies_repository.dart';
import 'package:gen/src/modules/home/domain/usecases/get_movies_usecase.dart';
import 'package:gen/src/shared/domain/errors/error_messages.dart';
import 'package:mocktail/mocktail.dart';

class MoviesRepositoryMock extends Mock implements IMoviesRepository {}

void main() {
  final repositoryMock = MoviesRepositoryMock();

  final usecase = GetMoviesUsecaseImpl(repository: repositoryMock);
  test("Should return empty movie error when list is empty", () async {
    when(repositoryMock.getMovies).thenAnswer((_) async => []);

    final result = await usecase();

    expect(result.leftMap((failure) => failure is EmptyMovieError), Left(true));
  });

  test("Should return error with correct message", () async {
    when(repositoryMock.getMovies).thenAnswer((_) async => []);

    final result = await usecase();

    expect(result.fold((failure) => failure.message, id),
        ErrorMessages.emptyMovies);
  });

  test("Should return a list of movies", () async {
    when(repositoryMock.getMovies).thenAnswer((_) async => [
          MovieEntity(
              adult: true,
              image: "",
              title: "Homem de Ferro",
              id: 3,
              overview: "",
              originalTitle: "",
              language: "en",
              voteAverage: 7.8,
              voteCount: 5989),
          MovieEntity(
              adult: true,
              image: "",
              title: "Homem de Ferro",
              id: 3,
              overview: "",
              originalTitle: "",
              language: "en",
              voteAverage: 7.8,
              voteCount: 5989)
        ]);

    final result = await usecase();

    expect(result.fold((l) => id, (r) => r), isA<List<MovieEntity>>());
  });
}
