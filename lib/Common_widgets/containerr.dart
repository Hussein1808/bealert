import 'package:flutter/material.dart';

class Containerr extends StatelessWidget {
  final h;
  final w;
  final decoration;
  const Containerr({
    super.key,
    this.h,
    this.w,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      decoration: decoration,
    );
  }
}
