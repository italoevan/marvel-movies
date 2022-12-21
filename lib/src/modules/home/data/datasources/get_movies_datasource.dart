import 'package:flutter/services.dart';

abstract class IGetMoviesDatasource {
  Future<dynamic> call();
}

class GetMoviesFromMockDatasource extends IGetMoviesDatasource {
  final String _mock = "assets/mock/movies_mock.json";

  @override
  Future call() async {
    await Future.delayed(const Duration(seconds: 3));
    var response = await rootBundle.loadString(_mock);
    return response;
  }
}
