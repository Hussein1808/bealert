// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors
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
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: TopRecord()),

            Expanded(flex: 4, child: MidRecord()),
            // Expanded(flex:1, child: MidEditProfile()),
            Expanded(flex: 1, child: BottomRecord())
          ],
        ),
      ),
    );
  }
}