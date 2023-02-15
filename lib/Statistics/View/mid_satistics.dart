// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class MidStatistics extends StatefulWidget {
  MidStatistics({super.key});

  @override
  State<StatefulWidget> createState() => MidStatisticsState();
}

class MidStatisticsState extends State<MidStatistics> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5);
    final barGroup2 = makeGroupData(1, 16);
    final barGroup3 = makeGroupData(2, 18);
    final barGroup4 = makeGroupData(3, 20);
    final barGroup5 = makeGroupData(4, 17);
    final barGroup6 = makeGroupData(5, 19);
    final barGroup7 = makeGroupData(6, 10);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final controller = GroupButtonController(selectedIndex: 0);
    return AspectRatio(
      aspectRatio: 1.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GroupButton(
                controller: controller,
                buttons: ['Week', 'Month'],
                options: GroupButtonOptions(
                  elevation: 0,
                  selectedColor: Theme.of(context).colorScheme.secondary,
                  selectedTextStyle: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedTextStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  spacing: 10,
                  buttonWidth: screenwidth * 0.2,
                  buttonHeight: screenheight * 0.05,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 38,
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 20,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Color.fromARGB(255, 255, 0, 0),
                    getTooltipItem: (a, b, c, d) => null,
                  ),
                  touchCallback: (FlTouchEvent event, response) {
                    if (response == null || response.spot == null) {
                      setState(() {
                        touchedGroupIndex = -1;
                        showingBarGroups = List.of(rawBarGroups);
                      });
                      return;
                    }

                    touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                    setState(() {
                      if (!event.isInterestedForInteractions) {
                        touchedGroupIndex = -1;
                        showingBarGroups = List.of(rawBarGroups);
                        return;
                      }
                      showingBarGroups = List.of(rawBarGroups);
                      if (touchedGroupIndex != -1) {
                        var sum = 0.0;
                        for (final rod
                            in showingBarGroups[touchedGroupIndex].barRods) {
                          sum += rod.toY;
                        }
                        final avg = sum /
                            showingBarGroups[touchedGroupIndex].barRods.length;

                        showingBarGroups[touchedGroupIndex] =
                            showingBarGroups[touchedGroupIndex].copyWith(
                          barRods: showingBarGroups[touchedGroupIndex]
                              .barRods
                              .map((rod) {
                            return rod.copyWith(toY: avg, color: Colors.white);
                          }).toList(),
                        );
                      }
                    });
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 42,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: 1,
                      getTitlesWidget: leftTitles,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: showingBarGroups,
                gridData: FlGridData(show: false),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Theme.of(context).secondaryHeaderColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0%';
    } else if (value == 10) {
      text = '50%';
    } else if (value == 20) {
      text = '100%';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

    final Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        color: Theme.of(context).secondaryHeaderColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y1,
  ) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          gradient: LinearGradient(
            colors: [
              Color(0xFF009fff),
              Color(0xFFec2f4b),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          width: width,
        ),
      ],
    );
  }
}
