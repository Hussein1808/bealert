// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textt extends StatelessWidget {
  final text;
  final size;
  final color;
  final decorationn;
  final font;
  const Textt(
      {Key? key,
      required this.text,
      this.size = 24.0,
      this.color = Colors.black,
      this.decorationn,
      this.font = GoogleFonts.roboto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: font(
            fontWeight: FontWeight.bold,
            fontSize: size,
            color: color,
            decoration: decorationn));
  }
}
