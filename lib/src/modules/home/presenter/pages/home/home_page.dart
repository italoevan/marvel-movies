import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen/src/consts/app_images.dart';
import 'package:gen/src/modules/home/presenter/pages/home/bloc/home_bloc.dart';
import 'package:gen/src/modules/home/presenter/pages/home/bloc/home_event.dart';
import 'package:gen/src/modules/home/presenter/pages/home/bloc/home_state.dart';
import 'package:gen/src/modules/home/presenter/widgets/success_state_widget.dart';
import 'package:gen/src/shared/presenter/widgets/generic_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc =
      HomeBloc(InitialHomeState(), getMoviesUsecase: Modular.get());

  @override
  void initState() {
    super.initState();
    homeBloc.add(GetMoviesHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: GenericAppBar(),
      drawer: const Drawer(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AppImages.homeBackground,
              fit: BoxFit.cover,
            ),
            BlocBuilder<HomeBloc, HomeState>(
                bloc: homeBloc,
                builder: (context, state) {
                  if (state is LoadingHomeState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is SucessHomeState) {
                    return SuccessStateWidget(state: state);
                  }

                  if (state is ErrorHomeState) {
                    return Text(state.message);
                  }
                  return const SizedBox();
                })
          ],
        ),
      ),
    );
  }
}
