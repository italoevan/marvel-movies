import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String image;
  const MoviePoster({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      height: 300,
      width: 170,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          )),
    );
  }
}
