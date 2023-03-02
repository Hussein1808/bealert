import 'package:flutter/material.dart';
import '../../Common_widgets/textt.dart';

class MidRecord extends StatefulWidget {
  const MidRecord({super.key});

  @override
  State<MidRecord> createState() => _MidRecordState();
}

class _MidRecordState extends State<MidRecord> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/maps.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
