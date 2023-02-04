// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable,prefer_const_constructors
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:bealert/Settings/Widgets/list_tile_settings.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';
import 'package:swipe/swipe.dart';
import 'package:unicons/unicons.dart';
import '../../Common_widgets/textt.dart';
import '../Data/tiles_data.dart';

class BottomSettings extends StatefulWidget {
  const BottomSettings({super.key});

  @override
  State<BottomSettings> createState() => _BottomSettingsState();
}

class _BottomSettingsState extends State<BottomSettings> {
  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: tiles.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListTilee(
            title: tiles[index].title,
            icon: tiles[index].icon,
            redirection: tiles[index].redirection,
          ),
        );
      },
    );
  }
}
