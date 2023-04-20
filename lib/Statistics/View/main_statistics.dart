// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'bottom_statistics.dart';
import 'mid_satistics.dart';
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

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 2, child: TopStatistics()),
            const Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: MidStatistics(),
                )),
            const Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: BottomStatistics(),
                ))
          ],
        ),
      ),
    );
  }
}
