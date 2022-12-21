import 'package:gen/src/modules/home/domain/entities/movie_entity.dart';

abstract class HomeState {
  const HomeState();
}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SucessHomeState extends HomeState {
  final List<MovieEntity> movies;
  const SucessHomeState({
    required this.movies,
  });
}

class ErrorHomeState extends HomeState {}
