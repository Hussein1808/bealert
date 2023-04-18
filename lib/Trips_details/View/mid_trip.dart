
import 'package:bealert/Common_widgets/textt.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MidTrip extends StatefulWidget {
  final drowsytimes;
  final tripdistance;

  const MidTrip(
      {super.key, required this.drowsytimes, required this.tripdistance});

  @override
  State<MidTrip> createState() => _MidTripState();
}

class _MidTripState extends State<MidTrip> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 11,
                child: BlurryContainer(
                  blur: 5,
                  width: screenwidth * 0.6,
                  height: screenheight * 0.11,
                  elevation: 0,
                  color:const  Color.fromARGB(140, 229, 229, 229),
                  padding: const EdgeInsets.all(8),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                           Expanded(
                            flex: 1,
                            child: Textt(
                              text: 'Number of Times being drowsy',
                              weight: FontWeight.w500,
                              font: GoogleFonts.righteous,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox.shrink()),
              Expanded(
                flex: 3,
                child: BlurryContainer(
                  blur: 5,
                  width: screenwidth * 0.1,
                  height: screenheight * 0.11,
                  elevation: 0,
                  color: const Color.fromARGB(140, 229, 229, 229),
                  padding: const EdgeInsets.all(8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Textt(
                            text: '${widget.drowsytimes}',
                            weight: FontWeight.w500,
                            font: GoogleFonts.righteous,
                            size: 42.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: BlurryContainer(
            blur: 5,
            width: screenwidth * 0.9,
            height: screenheight * 0.11,
            elevation: 0,
            color: const Color.fromARGB(140, 229, 229, 229),
            padding: const EdgeInsets.all(8),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Textt(
                        text: 'Distance Travelled',
                        weight: FontWeight.w500,
                        font: GoogleFonts.righteous,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Textt(
                        text: '${widget.tripdistance} km',
                        weight: FontWeight.w700,
                        size: 36.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
