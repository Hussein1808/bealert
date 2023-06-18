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

    return  SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: TopStatistics()),
            Expanded(
                flex: 10,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: MidStatistics(),
                )),
            Expanded(
                flex: 4,
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
