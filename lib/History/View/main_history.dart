// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bealert/Common_widgets/containerr.dart';
import 'package:bealert/Home/View/mid_home.dart';
import 'package:bealert/History/View/top_history.dart';
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
import 'bottom_history.dart';

class MainHistory extends StatefulWidget {
  const MainHistory({super.key});

  @override
  State<MainHistory> createState() => _MainHistoryState();
}

class _MainHistoryState extends State<MainHistory> {
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
            Expanded(flex: 1, child: TopHistory()),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: BottomHistory(),
                ))
          ],
        ),
      ),
    );
  }
}
