import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen/src/consts/routes/app_routes.dart';
import 'package:gen/src/modules/home/home_module.dart';
import 'package:gen/src/modules/movie_details/movie_details_module.dart';
import 'package:gen/src/modules/splash/presenter/pages/splash_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        ),
        ModuleRoute(AppRoutes.home, module: HomeModule()),
        ModuleRoute(AppRoutes.movieDetails, module: MovieDetailsModule())
      ];
}
