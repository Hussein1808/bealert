// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:bealert/Settings/View/top_settings.dart';
import 'package:flutter/material.dart';
import 'bottom_settings.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({super.key});

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  // final DateFormat _dateFormatter = DateFormat.MMMEd();
  // late var months = DateFormat.M().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: TopSettings()),
            Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: BottomSettings(),
                ))
          ],
        ),
      ),
    );
  }
}
