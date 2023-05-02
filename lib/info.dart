// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:unicons/unicons.dart';


class Info extends StatelessWidget {
  Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Title of first page",
            body:
                "Here you can write the description of the page, to explain someting...",
            image: const Center(child: Text('Image of first page')),
            decoration: PageDecoration(
              pageColor: Theme.of(context).scaffoldBackgroundColor,
              bodyTextStyle: const TextStyle(color: Colors.black),
              titleTextStyle:const  TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
          PageViewModel(
            title: "Title2",
            body: "T2",
            image: const Center(child: Text('Image of second page')),
            decoration: PageDecoration(
              pageColor: Theme.of(context).scaffoldBackgroundColor,
              bodyTextStyle: const TextStyle(color: Colors.black),
              titleTextStyle: const TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
          PageViewModel(
            title: "View your statistics",
            body:
                "View your weekly and monthly statistics to know which day you should sleep to prevent sleep deprivation",
            image: Image.asset('assets/screen3.png'),
            decoration: PageDecoration(
              pageColor: Theme.of(context).scaffoldBackgroundColor,
              bodyTextStyle: const TextStyle(color: Colors.black),
              titleTextStyle: const TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
        ],
        onDone: () => GoRouter.of(context).go('/start_screen'),
        onSkip: () => GoRouter.of(context).go('/start_screen'),
        showSkipButton: false,
        showBackButton: true,
        back: const Icon(
          UniconsLine.angle_left,
          size: 36.0,
        ),
        next: const Icon(
          UniconsLine.angle_right,
          size: 36.0,
        ),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
          size: const Size(12.0, 12.0),
          color: const Color(0xFFBDBDBD),
          activeColor: Theme.of(context).splashColor,
          activeSize: const Size(22.0, 10.0),
          activeShape: const RoundedRectangleBorder(
            borderRadius:  BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    ));
  }
}
