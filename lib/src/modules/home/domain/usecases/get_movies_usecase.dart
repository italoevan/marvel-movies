import 'package:dartz/dartz.dart';
import 'package:gen/src/modules/home/domain/errors/empty_movie_error.dart';
import 'package:gen/src/modules/home/domain/repositories/movies_repository.dart';
import 'package:gen/src/modules/home/domain/entities/movie_entity.dart';
import 'package:gen/src/shared/domain/errors/error_messages.dart';
import 'package:gen/src/shared/domain/errors/failure.dart';

abstract class IGetMoviesUsecase {
  const IGetMoviesUsecase();

  Future<Either<Failure, List<MovieEntity>>> call();
}

class GetMoviesUsecaseImpl extends IGetMoviesUsecase {
  final IMoviesRepository repository;

  const GetMoviesUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    var response = await await repository.getMovies();

    if (response.isEmpty) {
      return Left(EmptyMovieError(message: ErrorMessages.emptyMovies));
    }

    return Right(response);
  }
}
