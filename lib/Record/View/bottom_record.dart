import 'package:bealert/Common_widgets/containerr.dart';
import 'package:flutter/material.dart';

import '../../Common_widgets/textt.dart';

class BottomRecord extends StatefulWidget {
  const BottomRecord({super.key});

  @override
  State<BottomRecord> createState() => _BottomRecordState();
}

class _BottomRecordState extends State<BottomRecord> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Containerr(
      h: screenheight,
      w: screenwidth,
      color: Theme.of(context).primaryColor,
      child: FloatingActionButton(
        
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {},
        child: Textt(text: 'Start', color: Theme.of(context).primaryColor),
      ),
    );
  }
}
