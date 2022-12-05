// ignore_for_file: prefer_const_constructors

import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffoldd(
      bcolor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              SizedBoxx(h: 181.0),
              Image.asset('assets/Logo.png', height: 147, width: 179),
              SizedBoxx(h: 6.0),
              Textt(
                text: 'BE-ALERT',
                color: Theme.of(context).primaryColor,
                size: 48.0,
                font: GoogleFonts.righteous,
              ),
              SizedBoxx(h: 1.0),
              Textt(
                text: 'STAY AWAKE, DRIVE SAFE',
                color: Theme.of(context).primaryColor,
                size: 20.0,
              ),
              SizedBoxx(h: 118.0),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/signup_page');
                },
                child: Containerr(
                  w: 180.0,
                  h: 52.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                      child: Textt(
                    text: 'Sign Up',
                    color: Theme.of(context).primaryColor,
                  )),
                ),
              ),
              SizedBoxx(h: 15.0),
              GestureDetector(
                onTap: () {
                  print('heheh');
                },
                child: Containerr(
                  w: 180.0,
                  h: 52.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 6.0, color: Theme.of(context).splashColor)),
                  child: Center(
                      child: Textt(
                    text: 'Login',
                    color: Theme.of(context).primaryColor,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
