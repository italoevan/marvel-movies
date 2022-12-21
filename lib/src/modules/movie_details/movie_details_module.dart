import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen/src/modules/movie_details/presenter/pages/movie_details_page.dart';

class MovieDetailsModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => MovieDetailsPage(movie: args.data["movie"]),
        )
      ];
}
