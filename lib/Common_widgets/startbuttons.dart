// ignore_for_file: prefer_const_constructors
import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';

class StartButtons extends StatelessWidget {
  final width;
  final height;
  final redirect;
  final text;
  final bcolor;
  final tcolor;
  final border;
  final icon;
  final icolor;

  const StartButtons(
      {super.key,
      this.width = 146.0,
      this.height = 52.0,
      this.redirect,
      this.text,
      this.bcolor,
      this.tcolor,
      this.border,
      this.icon,
      this.icolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(redirect);
      },
      child: Containerr(
        w: width,
        h: height,
        decoration: BoxDecoration(
            color: bcolor,
            borderRadius: BorderRadius.circular(100),
            border: border),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Textt(
              text: text,
              color: tcolor,
            ),
            Icon(
              icon,
              color: icolor,
            ),
          ],
        ),
      ),
    );
  }
}
