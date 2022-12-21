import 'package:flutter/material.dart';
import 'package:gen/src/consts/app_images.dart';
import 'package:gen/src/modules/splash/presenter/pages/bloc/splash_bloc.dart';
import 'package:gen/src/modules/splash/presenter/pages/bloc/splash_event.dart';
import 'package:gen/src/modules/splash/presenter/pages/bloc/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashBloc bloc = SplashBloc(InitialStateSplashState());

  @override
  void initState() {
    super.initState();
    bloc.add(NavigateToHomeSplashEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          AppImages.marvelLogo,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
