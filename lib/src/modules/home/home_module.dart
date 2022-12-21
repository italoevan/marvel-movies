import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen/src/modules/home/data/datasources/get_movies_datasource.dart';
import 'package:gen/src/modules/home/data/repositories/movies_repository_impl.dart';
import 'package:gen/src/modules/home/domain/repositories/movies_repository.dart';
import 'package:gen/src/modules/home/domain/usecases/get_movies_usecase.dart';
import 'package:gen/src/modules/home/presenter/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, context) => const HomePage(),
        )
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.factory<IGetMoviesUsecase>(
            (i) => GetMoviesUsecaseImpl(repository: i())),
        Bind.factory<IMoviesRepository>(
            (i) => MoviesRepositoryImpl(getMoviesDatasource: i())),
        Bind.factory<IGetMoviesDatasource>((i) => GetMoviesFromMockDatasource())
      ];
}
