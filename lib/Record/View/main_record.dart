// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bottom_record.dart';
import 'mid_record.dart';
import 'top_record.dart';

class MainRecord extends StatefulWidget {
  const MainRecord({super.key});

  @override
  State<MainRecord> createState() => _MainRecordState();
}

class _MainRecordState extends State<MainRecord> {
  // final DateFormat _dateFormatter = DateFormat.MMMEd();
  // late var months = DateFormat.M().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    //* Screen size

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: TopRecord(distanceTravelled: 0)),

            const Expanded(flex: 24, child: MidRecord()),
            // Expanded(flex:1, child: MidEditProfile()),
            // const Expanded(flex: 4, child: BottomRecord())
          ],
        ),
      ),
    );
  }
}
