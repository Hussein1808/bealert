import 'package:flutter/material.dart';

class Containerr extends StatelessWidget {
  final h;
  final w;
  final decoration;
  final child;

  const Containerr({
    super.key,
    this.h,
    this.w,
    this.decoration,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      decoration: decoration,
      child: child,
    );
  }
}
