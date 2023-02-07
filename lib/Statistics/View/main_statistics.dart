// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bealert/Common_widgets/containerr.dart';
import 'package:bealert/Home/View/mid_home.dart';
import 'package:bealert/Settings/View/top_settings.dart';
//ignore_for_file:prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';
import 'package:swipe/swipe.dart';
import 'package:unicons/unicons.dart';
import '../../Common_widgets/textt.dart';
import '../../Home/View/bottom_home.dart';
import '../../Home/View/top_home.dart';
import 'bottom_statistics.dart';
import 'top_statistics.dart';

class MainStatistics extends StatefulWidget {
  const MainStatistics({super.key});

  @override
  State<MainStatistics> createState() => _MainStatisticsState();
}

class _MainStatisticsState extends State<MainStatistics> {
  // final DateFormat _dateFormatter = DateFormat.MMMEd();
  // late var months = DateFormat.M().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 4, child: TopStatistics()),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                child: Textt(
                  text: 'Events',
                  size: 35.0,
                  weight: FontWeight.w500,
                  font: GoogleFonts.righteous,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: BottomStatistics(),
                ))
          ],
        ),
      ),
    );
  }
}
