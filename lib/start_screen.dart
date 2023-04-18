// ignore_for_file: prefer_const_constructors
import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/startbuttons.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffoldd(
      bcolor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          children: [
            // const SizedBoxx(h: 181.0),
            const Expanded(flex: 4, child: SizedBox.shrink()),

            Expanded(
                flex: 10,
                child: Image.asset('assets/Logo.png', height: 147, width: 179)),
            // const SizedBoxx(h: 6.0),
            Expanded(
              flex: 3,
              child: Textt(
                text: 'BE-ALERT',
                color: Theme.of(context).primaryColor,
                size: 48.0,
                font: GoogleFonts.righteous,
              ),
            ),
            // const SizedBoxx(h: 1.0),
            Expanded(
              flex: 3,
              child: Textt(
                text: 'STAY AWAKE, DRIVE SAFE',
                color: Theme.of(context).primaryColor,
                size: 20.0,
              ),
            ),
            // const SizedBoxx(h: 118.0),
            const Expanded(flex: 3, child: SizedBox.shrink()),

            Expanded(
              flex: 2,
              child: StartButtons(
                width: 180.0,
                height: 52.0,
                bcolor: Theme.of(context).splashColor,
                tcolor: Theme.of(context).primaryColor,
                text: '    Sign Up',
                redirect: '/signup_page',
                weight: FontWeight.bold,
              ),
            ),
            const SizedBoxx(h: 15.0),

            Expanded(
              flex: 2,
              child: StartButtons(
                weight: FontWeight.bold,
                width: 180.0,
                height: 52.0,
                tcolor: Theme.of(context).primaryColor,
                text: '    Login',
                redirect: '/login_page',
                border: Border.all(
                    width: 6.0, color: Theme.of(context).splashColor),
              ),
            ),
            const Expanded(flex: 4, child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
