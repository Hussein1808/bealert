import 'package:bealert/Common_widgets/containerr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/time.dart';
import '../../Common_widgets/textt.dart';

class TopStatistics extends StatefulWidget {
  const TopStatistics({super.key});

  @override
  State<TopStatistics> createState() => _TopStatisticsState();
}

class _TopStatisticsState extends State<TopStatistics> {
  // final DateFormat _dateFormatter = DateFormat.MMMEd();
  // late var months = DateFormat.M().format(DateTime.now());
  late var daysinmonth = daysInMonth(DateTime.now().year, DateTime.now().month);
  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
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
                bottomRight: Radius.circular(25),
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
              w: screenwidth * 0.35,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Textt(
                      text: 'Statistics',
                      font: GoogleFonts.roboto,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24.0,
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
