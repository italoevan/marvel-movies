import 'package:flutter/material.dart';
import 'package:gen/src/consts/app_images.dart';

class GenericAppBar extends StatelessWidget with PreferredSizeWidget {
  GenericAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Image.asset(
        AppImages.marvelLogo,
        width: 80,
        height: 60,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
