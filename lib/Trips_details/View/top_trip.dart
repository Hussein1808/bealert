
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../../Common_widgets/textt.dart';

class TopTrip extends StatefulWidget {
  final  drowsytimes;
  final date;

  const TopTrip({super.key, required this.drowsytimes, required this.date});

  @override
  State<TopTrip> createState() => _TopTripState();
}

class _TopTripState extends State<TopTrip> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlurryContainer(
              blur: 5,
              width: screenwidth * 0.6,
              height: screenheight * 0.07,
              elevation: 0,
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(8),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              child: Center(
                  child: Textt(
                text: '${widget.date}',
                weight: FontWeight.w600,
                size: 32.0,
              )),
            ),
          ],
        ),
      ],
    );
  }
}
