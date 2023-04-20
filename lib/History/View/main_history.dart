// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bealert/History/View/top_history.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 2, child: TopHistory()),
            const Expanded(
                flex: 10,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: BottomHistory(),
                ))
          ],
        ),
      ),
    );
  }
}
