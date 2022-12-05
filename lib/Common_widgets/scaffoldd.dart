import 'package:flutter/material.dart';

class Scaffoldd extends StatelessWidget {
  final bcolor;
  final body;
  final bNBar;

  const Scaffoldd(
      {super.key,
      this.bcolor = const Color(0xFF007CD7),
      required this.body,
      this.bNBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bcolor,
      body: body,
      bottomNavigationBar: bNBar,
    );
  }
}
