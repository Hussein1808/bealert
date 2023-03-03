// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:go_router/go_router.dart';

import '../../Common_widgets/textt.dart';
import 'bottom_trip.dart';
import 'mid_trip.dart';
import 'top_trip.dart';

class TripDetails extends StatefulWidget {
  final title;
  final trailing;

  TripDetails({super.key, required this.title, required this.trailing});

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Trip details',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: screenwidth * 0.05),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 200,
              left: 10,
              child: GradientBall(
                colors: [
                  Colors.deepOrange,
                  Colors.amber,
                ],
              ),
            ),
            Positioned(
              top: 300,
              right: -90,
              child: GradientBall(
                size: Size.square(200),
                colors: [Colors.blue, Colors.purple],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: TopTrip(
                        drowsytimes: widget.trailing, date: widget.title)),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                      child: MidTrip(
                        drowsytimes: widget.trailing,
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 16.0),
                      child: BottomTrip(),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GradientBall extends StatelessWidget {
  final List<Color> colors;
  final Size size;
  const GradientBall({
    Key? key,
    required this.colors,
    this.size = const Size.square(150),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
    );
  }
}
