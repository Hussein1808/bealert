import 'package:bealert/Common_widgets/containerr.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:swipe/swipe.dart';

import '../../Common_widgets/textt.dart';

class TopHistory extends StatefulWidget {
  const TopHistory({super.key});

  @override
  State<TopHistory> createState() => _TopHistoryState();
}

class _TopHistoryState extends State<TopHistory> {
  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          Swipe(
            onSwipeDown: () {
              GoRouter.of(context).go('/home/0');
            },
            child: Stack(
              children: [
                Containerr(
                  w: screenwidth,
                  h: screenheight * 0.12,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).splashColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21.0),
                  child: Containerr(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    w: screenwidth * 0.43,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Textt(
                            text: 'History',
                            font: GoogleFonts.roboto,
                            color: Theme.of(context).colorScheme.primary,
                            size: screenwidth * 0.05,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
