import 'package:flutter/material.dart';

class Containerr extends StatelessWidget {
  final h;
  final w;
  final decoration;
  final child;
  final color;
  final margin;
  const Containerr(
      {super.key,
      this.h = 52.0,
      this.w = 146.0,
      this.decoration,
      this.child,
      this.color,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      decoration: decoration,
      color: color,
      child: child,
      margin: margin,
    );
  }
}
