import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen/src/consts/routes/app_routes.dart';
import 'package:gen/src/modules/splash/presenter/pages/bloc/splash_event.dart';
import 'package:gen/src/modules/splash/presenter/pages/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(super.initialState) {
    on<NavigateToHomeSplashEvent>(_mapNavigateToHome);
  }

  _mapNavigateToHome(
      NavigateToHomeSplashEvent event, Emitter<SplashState> emitter) {
    Timer(const Duration(seconds: 3), () {
      Modular.to.pushReplacementNamed(AppRoutes.home);
    });
  }
}
