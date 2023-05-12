// ignore_for_file:,prefer_const_literals_to_create_immutables

import 'package:bealert/Record/Providers/drowsiness_provider.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import '../../Common_widgets/divider.dart';
import '../../Common_widgets/textt.dart';
import '../Providers/distance_providers.dart';

class TopRecord extends StatefulWidget {
  double distanceTravelled;
  TopRecord({super.key, required this.distanceTravelled});

  @override
  State<TopRecord> createState() => _TopRecordState();
}

class _TopRecordState extends State<TopRecord> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(UniconsLine.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:
            const Center(child: Textt(text: 'Record', weight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(
              UniconsLine.graph_bar,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              showMaterialModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                context: context,
                builder: (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: Container(
                    height: screenheight * 0.85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: SizedBox.shrink()),
                        // const Expanded(child: Textt(text: 'Time')),
                        // const Expanded(
                        //   flex: 2,
                        //   child: Textt(
                        //     text: '00:44:24',
                        //     size: 72.0,
                        //     font: GoogleFonts.firaSans,
                        //   ),
                        // ),
                        // const Div(),
                        const Expanded(
                            flex: 2,
                            child: Textt(
                              text: 'Drowsiness Level',
                              weight: FontWeight.bold,
                              size: 30.0,
                            )),
                        Expanded(
                          flex: 5,
                          child: CircularSeekBar(
                            width: double.infinity,
                            height: 250,
                            progress: (double.parse(
                                        context.watch<Drowsiness>().drow) +
                                    1) *
                                25,
                            barWidth: 9,
                            startAngle: 90,
                            sweepAngle: 180,
                            strokeCap: StrokeCap.round,
                            progressGradientColors: [
                              const Color.fromARGB(255, 68, 243, 33),
                              const Color.fromARGB(255, 255, 234, 0),
                              const Color.fromARGB(255, 255, 183, 0),
                              const Color.fromARGB(255, 255, 0, 0)
                            ],
                            dashWidth: 37,
                            dashGap: 10,
                            animation: true,
                            child: Center(
                              child: Textt(
                                text: (int.parse(
                                            context.watch<Drowsiness>().drow) +
                                        1)
                                    .toString(),
                                size: 56.0,
                                font: GoogleFonts.firaSans,
                              ),
                            ),
                          ),
                        ),
                        const Div(),
                        const Expanded(flex: 1, child: SizedBox.shrink()),
                        const Expanded(
                            flex: 2,
                            child: Textt(
                              text: 'Distance',
                              weight: FontWeight.bold,
                              size: 30.0,
                            )),
                        Expanded(
                          flex: 2,
                          child: Textt(
                            text: context.watch<Distance>().dist,
                            size: 34.0,
                            font: GoogleFonts.firaSans,
                            weight: FontWeight.bold,
                          ),
                        ),
                        const Expanded(
                            flex: 2, child: Textt(text: 'Kilometers')),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
