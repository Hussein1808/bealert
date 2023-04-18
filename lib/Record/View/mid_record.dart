import 'package:flutter/material.dart';

class MidRecord extends StatefulWidget {
  const MidRecord({super.key});

  @override
  State<MidRecord> createState() => _MidRecordState();
}

class _MidRecordState extends State<MidRecord> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/maps.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
