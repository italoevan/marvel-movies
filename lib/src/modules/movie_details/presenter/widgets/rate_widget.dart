import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final double value;

  const RateWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.white)),
      child: Center(
          child: Text(
        value.toString(),
        style: TextStyle(color: Colors.white, fontSize: 14),
      )),
    );
  }
}
