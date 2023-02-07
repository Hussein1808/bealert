import 'package:bealert/Common_widgets/containerr.dart';
import 'package:bealert/History/Data/tiles_data.dart';
//ignore_for_file:prefer_const_constructors
import 'package:flutter/material.dart';

import '../../History/Widgets/list_tile_history.dart';

class BottomStatistics extends StatefulWidget {
  const BottomStatistics({super.key});

  @override
  State<BottomStatistics> createState() => _BottomStatisticsState();
}

class _BottomStatisticsState extends State<BottomStatistics> {
  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: histories.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: HistoryListTilee(
            title: histories[index].date,
            trailing: histories[index].drowsydays,
          ),
        );
      },
    );
  }
}
