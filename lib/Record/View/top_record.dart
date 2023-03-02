// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:unicons/unicons.dart';

import '../../Common_widgets/divider.dart';
import '../../Common_widgets/textt.dart';

class TopRecord extends StatefulWidget {
  const TopRecord({super.key});

  @override
  State<TopRecord> createState() => _TopRecordState();
}

class _TopRecordState extends State<TopRecord> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: screenwidth * 0.15,
                child: FloatingActionButton(
                  heroTag: "btn1",
                  elevation: 0.0,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    showMaterialModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: Container(
                          height: screenheight * 0.85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: SizedBox.shrink()),
                              Expanded(child: Textt(text: 'Time')),
                              Expanded(
                                flex: 2,
                                child: Textt(
                                  text: '00:44:24',
                                  size: 72.0,
                                  font: GoogleFonts.firaSans,
                                ),
                              ),
                              Div(),
                              Expanded(child: Textt(text: 'Drowsiness Level')),
                              Expanded(
                                flex: 3,
                                child: CircularSeekBar(
                                  width: double.infinity,
                                  height: 250,
                                  progress: 100,
                                  barWidth: 9,
                                  startAngle: 90,
                                  sweepAngle: 180,
                                  strokeCap: StrokeCap.round,
                                  progressGradientColors: [
                                    Color.fromARGB(255, 68, 243, 33),
                                    Color.fromARGB(255, 255, 234, 0),
                                    Color.fromARGB(255, 255, 183, 0),
                                    Color.fromARGB(255, 255, 0, 0)
                                  ],
                                  dashWidth: 37,
                                  dashGap: 10,
                                  animation: true,
                                  child: Center(
                                    child: Textt(
                                      text: '4',
                                      size: 56.0,
                                      font: GoogleFonts.firaSans,
                                    ),
                                  ),
                                ),
                              ),
                              Div(),
                              Expanded(child: Textt(text: 'Distance')),
                              Expanded(
                                flex: 2,
                                child: Textt(
                                  text: '0.02',
                                  size: 72.0,
                                  font: GoogleFonts.firaSans,
                                ),
                              ),
                              Expanded(child: Textt(text: 'Kilometers')),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Icon(UniconsLine.graph_bar,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
