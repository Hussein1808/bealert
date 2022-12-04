// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textt extends StatelessWidget {
  final text;
  final size;
  final color;
  final decorationn;
  const Textt({
    Key? key,
    required this.text,
    this.size = 16,
    this.color = Colors.black,
    this.decorationn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: size,
            color: color,
            decoration: decorationn));
  }
}
