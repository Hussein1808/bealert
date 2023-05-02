import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Common_widgets/textt.dart';
import '../Providers/pause_provider.dart';

class BottomRecord extends StatefulWidget {
  const BottomRecord({super.key});

  @override
  State<BottomRecord> createState() => _BottomRecordState();
}

class _BottomRecordState extends State<BottomRecord>
    with SingleTickerProviderStateMixin {
  bool start = false;
  bool choose = true;
  late bool _ispaused;
  late CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin:const  Duration(hours: 0, minutes: 0, seconds: 0),
      end:const  Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds);
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomTimer(
            controller: _controller,
            builder: (state, time) {
              // Build the widget you want!🎉
              return Text("${time.hours}:${time.minutes}:${time.seconds}",
                  style: const TextStyle(fontSize: 24.0));
            }),
        Containerr(
            w: screenwidth,
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 2.0,
              ),
            )),
            child: start
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
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
                                      _controller.pause();
                                      choose = false;
                                      context
                                          .read<Pause>()
                                          .paused(_ispaused = false);
                                      print('$_ispaused');
                                      AnimatedSnackBar.material(
                                        'Paused',
                                        type: AnimatedSnackBarType.warning,
                                        mobileSnackBarPosition:
                                            MobileSnackBarPosition.bottom,
                                        desktopSnackBarPosition:
                                            DesktopSnackBarPosition.bottomLeft,
                                        duration:const  Duration(milliseconds: 300),
                                      ).show(context);
                                    });
                                  },
                                  child: Icon(Icons.square,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
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
                                    width: screenwidth * 0.235,
                                    child: FloatingActionButton(
                                      elevation: 0.0,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      onPressed: () {
                                        setState(() {
                                          _controller.start();
                                          choose = true;
                                          context
                                              .read<Pause>()
                                              .paused(_ispaused = false);
                                        });
                                      },
                                      child: Textt(
                                        text: 'RESUME',
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        weight: FontWeight.w900,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: screenwidth * 0.235,
                                    child: FloatingActionButton(
                                      elevation: 0.0,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      onPressed: () {
                                        setState(() {
                                          _controller.reset();
                                          start = false;
                                          choose = true;
                                        });
                                      },
                                      child: Textt(
                                        text: 'FINISH',
                                        color: Theme.of(context).primaryColor,
                                        weight: FontWeight.w900,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  )
                : FloatingActionButton(
                    elevation: 0.0,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      setState(() {
                        _controller.start();
                        context.read<Pause>().paused(_ispaused = false);

                        start = true;
                        AnimatedSnackBar.material(
                          'Trip started',
                          type: AnimatedSnackBarType.warning,
                          mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                          desktopSnackBarPosition:
                              DesktopSnackBarPosition.bottomLeft,
                          duration: const Duration(milliseconds: 300),
                        ).show(context);
                      });
                    },
                    child: Textt(
                      text: 'Start',
                      color: Theme.of(context).primaryColor,
                      weight: FontWeight.w700,
                    ),
                  )),
      ],
    );
  }
}
