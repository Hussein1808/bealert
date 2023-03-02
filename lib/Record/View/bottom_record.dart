import 'package:bealert/Common_widgets/containerr.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../Common_widgets/textt.dart';

class BottomRecord extends StatefulWidget {
  const BottomRecord({super.key});

  @override
  State<BottomRecord> createState() => _BottomRecordState();
}

class _BottomRecordState extends State<BottomRecord> {
  bool start = false;
  bool choose = true;
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Containerr(
        w: screenwidth,
        color: Theme.of(context).primaryColor,
        child: start
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  choose
                      ? SizedBox(
                          width: screenwidth * 0.25,
                          child: FloatingActionButton(
                            elevation: 0.0,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              setState(() {
                                choose = false;
                              });
                            },
                            child: Icon(Icons.square,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                size: 35),
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              width: screenwidth * 0.25,
                              child: FloatingActionButton(
                                elevation: 0.0,
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                onPressed: () {
                                  setState(() {
                                    choose = true;
                                  });
                                },
                                child: Textt(
                                  text: 'Resume',
                                  color: Theme.of(context).primaryColor,
                                  weight: FontWeight.w600,
                                  size: 22.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: screenwidth * 0.25,
                              child: FloatingActionButton(
                                elevation: 0.0,
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                onPressed: () {
                                  setState(() {
                                    choose = true;
                                  });
                                },
                                child: Textt(
                                  text: 'Finish',
                                  color: Theme.of(context).primaryColor,
                                  weight: FontWeight.w600,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              )
            : FloatingActionButton(
                elevation: 0.0,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  setState(() {
                    start = true;
                  });
                },
                child: Textt(
                  text: 'Start',
                  color: Theme.of(context).primaryColor,
                  weight: FontWeight.w600,
                ),
              ));
  }
}
