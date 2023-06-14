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
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffoldd(
      bcolor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          children: [
            // const SizedBoxx(h: 181.0),
            const Expanded(flex: 4, child: SizedBox.shrink()),

            Expanded(
                flex: 7,
                child: Image.asset(
                  'assets/Logo.png',
                  height: screenheight * 0.55,
                  width: screenwidth * 0.55,
                )),
            // const SizedBoxx(h: 6.0),
            Expanded(
              flex: 2,
              child: Textt(
                text: 'BE-ALERT',
                color: Theme.of(context).primaryColor,
                size: screenwidth * 0.1,
                font: GoogleFonts.righteous,
              ),
            ),
            // const SizedBoxx(h: 1.0),
            Expanded(
              flex: 2,
              child: Textt(
                text: 'STAY AWAKE, DRIVE SAFE',
                color: Theme.of(context).primaryColor,
                size: screenwidth * 0.04,
              ),
            ),
            // const SizedBoxx(h: 118.0),
            const Expanded(flex: 2, child: SizedBox.shrink()),

            StartButtons(
              width: screenwidth * 0.7,
              height: screenheight * 0.07,
              bcolor: Theme.of(context).splashColor,
              tcolor: Theme.of(context).primaryColor,
              text: '    Sign Up',
              redirect: '/signup_page',
              weight: FontWeight.bold,
              size: screenwidth * 0.05,
            ),
            const SizedBoxx(h: 15.0),

            StartButtons(
              weight: FontWeight.bold,
              width: screenwidth * 0.7,
              height: screenheight * 0.07,
              tcolor: Theme.of(context).primaryColor,
              text: '    Login',
              redirect: '/login_page',
              size: screenwidth * 0.05,
              border:
                  Border.all(width: 5.0, color: Theme.of(context).splashColor),
            ),
            const Expanded(flex: 1, child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
