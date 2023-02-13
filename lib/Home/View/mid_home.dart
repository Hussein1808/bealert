// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable,prefer_const_constructors
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';
import 'package:swipe/swipe.dart';
import 'package:unicons/unicons.dart';
import '../../Common_widgets/textt.dart';

class MidHome extends StatefulWidget {
  const MidHome({super.key});

  @override
  State<MidHome> createState() => _MidHomeState();
}

class _MidHomeState extends State<MidHome> {
  final DateFormat _dateFormatter = DateFormat.MMMMd();
  late var month_day = _dateFormatter.format(DateTime.now());
  late var months = DateFormat.M().format(DateTime.now());
  late var daysinmonth = daysInMonth(DateTime.now().year, DateTime.now().month);
  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            Textt(
              text: 'Your statistics',
              font: GoogleFonts.righteous,
              size: 36.0,
            ),
          ],
        ),
        Row(
          children: [
            Textt(
              text: 'for today, ',
              font: GoogleFonts.roboto,
              size: 16.0,
            ),
            Textt(
              text: '$month_day',
              font: GoogleFonts.roboto,
              size: 16.0,
              weight: FontWeight.bold,
            ),
          ],
        )
      ]),
    );
  }
}
