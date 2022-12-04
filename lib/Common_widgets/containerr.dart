import 'package:flutter/material.dart';

class Containerr extends StatelessWidget {
  final h;
  final w;
  final color;
  const Containerr({
    super.key,
    this.h,
    this.w,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      color: color,
    );
  }
}
