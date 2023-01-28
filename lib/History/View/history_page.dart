import 'package:bealert/Common_widgets/containerr.dart';
//ignore_for_file:prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';
import 'package:swipe/swipe.dart';
import 'package:unicons/unicons.dart';
import '../../Common_widgets/textt.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
            child: Containerr(
              w: screenwidth,
              h: screenheight * 0.075,
              decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Your Drowsy Days
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Textt(
                            text: 'History',
                            font: GoogleFonts.roboto,
                            color: Theme.of(context).primaryColor,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                    //* Number of Days in month
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
