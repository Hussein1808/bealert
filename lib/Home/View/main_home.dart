// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bealert/Home/View/mid_home.dart';
import 'package:flutter/material.dart';
import 'bottom_home.dart';
import 'top_home.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
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
            Expanded(flex: 8, child: TopHome()),
            Expanded(
                flex: 3,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: MidHome(),
                )),
           Expanded(
                flex: 11,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: BottomHome(),
                ))
          ],
        ),
      ),
    );
  }
}
