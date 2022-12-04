import 'package:flutter/material.dart';

class SizedBoxx extends StatelessWidget {
  final h;
  final w;

  const SizedBoxx({super.key, this.h, this.w});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
    );
  }
}
