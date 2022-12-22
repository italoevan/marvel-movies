import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/src/modules/home/domain/usecases/get_movies_usecase.dart';
import 'package:gen/src/modules/home/presenter/pages/home/bloc/home_event.dart';
import 'package:gen/src/modules/home/presenter/pages/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IGetMoviesUsecase _getMoviesUsecase;

  HomeBloc(
    super.initialState, {
    required IGetMoviesUsecase getMoviesUsecase,
  }) : _getMoviesUsecase = getMoviesUsecase {
    on<GetMoviesHomeEvent>(_mapGetMovies);
  }

  _mapGetMovies(GetMoviesHomeEvent event, Emitter<HomeState> emitter) async {
    emitter(LoadingHomeState());

    var movies = await _getMoviesUsecase();
    movies.fold((l) {
      emitter(ErrorHomeState(l.message));
    }, (r) {
      emitter(SucessHomeState(movies: r));
    });
  }
}
