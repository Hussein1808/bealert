import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Common_widgets/textt.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  bool _isRed = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _isRed = !_isRed;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: _isRed ? Colors.red : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Textt(
                text: 'Drowsiness Detected!',
                size: 35.0,
                font: GoogleFonts.righteous,
              ),
              const Text(
                'Please take a break!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  GoRouter.of(context).pop();
                  FlutterRingtonePlayer.stop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
