import 'package:flutter/material.dart';
import 'package:gen/src/consts/app_consts.dart';
import 'package:gen/src/modules/home/presenter/pages/home/bloc/home_state.dart';
import 'package:gen/src/modules/home/presenter/widgets/movie_item.dart';

class SuccessStateWidget extends StatelessWidget {
  final SucessHomeState state;
  const SuccessStateWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.transparent,
            Colors.black,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                SizedBox(
                  height: 10,
                ),
                _buildSubTitle(),
                SizedBox(
                  height: 450,
                  child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          MovieItem(movie: state.movies[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                      itemCount: state.movies.length),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        AppConsts.homeTitle,
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSubTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Linha do tempo",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
