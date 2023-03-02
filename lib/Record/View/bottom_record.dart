import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:animated_toast_list/animated_toast_list.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
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
                                AnimatedSnackBar.material(
                                  'Paused',
                                  type: AnimatedSnackBarType.warning,
                                  mobileSnackBarPosition:
                                      MobileSnackBarPosition.bottom,
                                  desktopSnackBarPosition:
                                      DesktopSnackBarPosition.bottomLeft,
                                  duration: Duration(milliseconds: 300),
                                ).show(context);
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
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 3,
                                      style: BorderStyle.solid)),
                              width: screenwidth * 0.23,
                              child: FloatingActionButton(
                                elevation: 0.0,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                onPressed: () {
                                  setState(() {
                                    choose = true;
                                  });
                                },
                                child: Textt(
                                  text: 'RESUME',
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  weight: FontWeight.w700,
                                  size: 16.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: screenwidth * 0.23,
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
                                  text: 'FINISH',
                                  color: Theme.of(context).primaryColor,
                                  weight: FontWeight.w700,
                                  size: 16.0,
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
                  weight: FontWeight.w700,
                ),
              ));
  }
}
