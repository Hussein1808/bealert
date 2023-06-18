import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import '../../Common_widgets/textt.dart';
import '../../Record/Domain/trip_data_domain.dart';
import '../../Record/Repository/trip_data_repo.dart';

class MidStatistics extends StatefulWidget {
  const MidStatistics({super.key});

  @override
  State<StatefulWidget> createState() => MidStatisticsState();
}

class MidStatisticsState extends State<MidStatistics> {
  final double width = 7;

  final TripsRepository _repository = TripsRepository();
  List<Trips> _trips = [];

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  late List<BarChartGroupData> rawBarGroupsmon;
  late List<BarChartGroupData> showingBarGroupsmon;

  int touchedGroupIndex = -1;
  Future<void> _getTrips() async {
    final trip=await _repository.getTrips();
    setState(() {
      _trips = trip;
    });

  }
  @override
  void initState() {
    super.initState();
    _getTrips();



  }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final barGroup1 = makeGroupData(0, checkdrowsyweek(0));
    final barGroup2 = makeGroupData(1, checkdrowsyweek(1));
    final barGroup3 = makeGroupData(2, checkdrowsyweek(2));
    final barGroup4 = makeGroupData(3, checkdrowsyweek(3));
    final barGroup5 = makeGroupData(4, checkdrowsyweek(4));
    final barGroup6 = makeGroupData(5, checkdrowsyweek(5));
    final barGroup7 = makeGroupData(6, checkdrowsyweek(6));

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

    final barGroupmon1 = makeGroupData(0, checkdrowsymonth( 0));
    final barGroupmon2 = makeGroupData(1, checkdrowsymonth(1));
    final barGroupmon3 = makeGroupData(2, checkdrowsymonth(2));
    final barGroupmon4 = makeGroupData(3, checkdrowsymonth(3));

    final itemsmon = [
      barGroupmon1,
      barGroupmon2,
      barGroupmon3,
      barGroupmon4,
    ];

    rawBarGroupsmon = itemsmon;

    showingBarGroupsmon = rawBarGroupsmon;

    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    bool week = true;
    final controller = GroupButtonController(selectedIndex: 0);
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GroupButton(
                onSelected: (value, index, isSelected) {
                  if (index == 0) {
                    _scrollController.animateTo(
                      0.0,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                    week = true;
                  } else {
                    _scrollController.animateTo(
                      screenwidth * 0.9,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                    week = false;
                  }
                },
                controller: controller,
                buttons: const ['Week', 'Month'],
                options: GroupButtonOptions(
                  elevation: 0,
                  selectedColor: Theme.of(context).colorScheme.secondary,
                  selectedTextStyle: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: screenwidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedTextStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: screenwidth * 0.03,
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
        ),
        const SizedBoxx(
          h: 32.0,
        ),
        Expanded(
          flex: 15,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: screenwidth / screenheight * 2.9,
                  child: BarChart(
                    BarChartData(
                      maxY: 20,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: const Color.fromARGB(255, 255, 0, 0),
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

                          touchedGroupIndex =
                              response.spot!.touchedBarGroupIndex;

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
                                  in showingBarGroups[touchedGroupIndex]
                                      .barRods) {
                                sum += rod.toY;
                              }
                              final avg = sum /
                                  showingBarGroups[touchedGroupIndex]
                                      .barRods
                                      .length;

                              showingBarGroups[touchedGroupIndex] =
                                  showingBarGroupsmon[touchedGroupIndex]
                                      .copyWith(
                                barRods: showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .map((rod) {
                                  return rod.copyWith(
                                    toY: avg,
                                  );
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
                            reservedSize: 40,
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: screenwidth / screenheight * 2.9,
                  child: BarChart(
                    BarChartData(
                      maxY: 20,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: const Color.fromARGB(255, 255, 0, 0),
                          getTooltipItem: (a, b, c, d) => null,
                        ),
                        touchCallback: (FlTouchEvent event, response) {
                          if (response == null || response.spot == null) {
                            setState(() {
                              touchedGroupIndex = -1;
                              showingBarGroupsmon = List.of(rawBarGroups);
                            });
                            return;
                          }

                          touchedGroupIndex =
                              response.spot!.touchedBarGroupIndex;

                          setState(() {
                            if (!event.isInterestedForInteractions) {
                              touchedGroupIndex = -1;
                              showingBarGroupsmon = List.of(rawBarGroups);
                              return;
                            }
                            showingBarGroupsmon = List.of(rawBarGroups);
                            if (touchedGroupIndex != -1) {
                              var sum = 0.0;
                              for (final rod
                                  in showingBarGroupsmon[touchedGroupIndex]
                                      .barRods) {
                                sum += rod.toY;
                              }
                              final avg = sum /
                                  showingBarGroupsmon[touchedGroupIndex]
                                      .barRods
                                      .length;

                              showingBarGroupsmon[touchedGroupIndex] =
                                  showingBarGroupsmon[touchedGroupIndex]
                                      .copyWith(
                                barRods: showingBarGroupsmon[touchedGroupIndex]
                                    .barRods
                                    .map((rod) {
                                  return rod.copyWith(
                                    toY: avg,
                                  );
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
                            getTitlesWidget: bottomTitlesmonth,
                            reservedSize: 42,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            interval: 1,
                            getTitlesWidget: leftTitles,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroupsmon,
                      gridData: FlGridData(show: false),
                    ),
                  ),
                ),
              )
            ],
          ),
          // child: ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemCount: 2,
          //   controller: _scrollController,
          //   itemBuilder: (context, index) {
          //     return Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: AspectRatio(
          //         aspectRatio: screenwidth / screenheight * 2.9,
          //         child: BarChart(
          //           BarChartData(
          //             maxY: 20,
          //             barTouchData: BarTouchData(
          //               touchTooltipData: BarTouchTooltipData(
          //                 tooltipBgColor: Color.fromARGB(255, 255, 0, 0),
          //                 getTooltipItem: (a, b, c, d) => null,
          //               ),
          //               touchCallback: (FlTouchEvent event, response) {
          //                 if (response == null || response.spot == null) {
          //                   setState(() {
          //                     touchedGroupIndex = -1;
          //                     showingBarGroupsmon = List.of(rawBarGroups);
          //                   });
          //                   return;
          //                 }

          //                 touchedGroupIndex =
          //                     response.spot!.touchedBarGroupIndex;

          //                 setState(() {
          //                   if (!event.isInterestedForInteractions) {
          //                     touchedGroupIndex = -1;
          //                     showingBarGroupsmon = List.of(rawBarGroups);
          //                     return;
          //                   }
          //                   showingBarGroupsmon = List.of(rawBarGroups);
          //                   if (touchedGroupIndex != -1) {
          //                     var sum = 0.0;
          //                     for (final rod
          //                         in showingBarGroupsmon[touchedGroupIndex]
          //                             .barRods) {
          //                       sum += rod.toY;
          //                     }
          //                     final avg = sum /
          //                         showingBarGroupsmon[touchedGroupIndex]
          //                             .barRods
          //                             .length;

          //                     showingBarGroupsmon[touchedGroupIndex] =
          //                         showingBarGroupsmon[touchedGroupIndex].copyWith(
          //                       barRods: showingBarGroupsmon[touchedGroupIndex]
          //                           .barRods
          //                           .map((rod) {
          //                         return rod.copyWith(
          //                           toY: avg,
          //                         );
          //                       }).toList(),
          //                     );
          //                   }
          //                 });
          //               },
          //             ),
          //             titlesData: FlTitlesData(
          //               show: true,
          //               rightTitles: AxisTitles(
          //                 sideTitles: SideTitles(showTitles: false),
          //               ),
          //               topTitles: AxisTitles(
          //                 sideTitles: SideTitles(showTitles: false),
          //               ),
          //               bottomTitles: AxisTitles(
          //                 sideTitles: SideTitles(
          //                   showTitles: true,
          //                   getTitlesWidget: bottomTitles,
          //                   reservedSize: 42,
          //                 ),
          //               ),
          //               leftTitles: AxisTitles(
          //                 sideTitles: SideTitles(
          //                   showTitles: true,
          //                   reservedSize: 40,
          //                   interval: 1,
          //                   getTitlesWidget: leftTitles,
          //                 ),
          //               ),
          //             ),
          //             borderData: FlBorderData(
          //               show: false,
          //             ),
          //             barGroups: showingBarGroupsmon,
          //             gridData: FlGridData(show: false),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ),
        const Expanded(flex: 1, child: SizedBox.shrink()),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Textt(
              text: 'Events',
              size: screenwidth * 0.07,
              weight: FontWeight.w500,
              font: GoogleFonts.righteous,
            ),
          ),
        ),
      ],
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Theme.of(context).secondaryHeaderColor,
      fontWeight: FontWeight.bold,
      fontSize: 10,
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
        fontSize: 10,
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
          gradient: const LinearGradient(
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

  Widget bottomTitlesmonth(double value, TitleMeta meta) {
    final titles = <String>[
      'Week 1',
      'Week 2',
      'Week 3',
      'Week 4',
    ];

    final Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        color: Theme.of(context).secondaryHeaderColor,
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupDatamonth(
    int x,
    double y1,
  ) {
    return BarChartGroupData(
      barsSpace: 2,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          gradient: const LinearGradient(
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



  double checkdrowsymonth(int x){
    List<int> weeksinmonth = getWeekNumbersInMonth(DateTime.now().year, DateTime.now().month);
    int index = x * 7;
    // print('Week numbers in month: $weeksinmonth');
    for (var i in _trips){
     // if (weeksinmonth.contains(int.parse(_getWeekNumber(i.time!)))){
       if (int.parse(_getWeekNumber(i.time!))==weeksinmonth[index]){

          if (i.drowsinesstimes!>0){
            return 20;
          }

      }
    }
    return 1;

  }
  String _getWeekNumber(DateTime date) {
    int weekNumber = ((date.difference(DateTime.utc(date.year, 1, 1)).inDays / 7) + 1).floor();
    return weekNumber.toString();
  }
  List<int> getWeekNumbersInMonth(int year, int month) {
    // Calculate the start and end dates of the month
    DateTime startDate = DateTime(year, month);
    DateTime endDate = DateTime(year, month + 1, 0);

    // Calculate the week number for each day of the month
    List<int> weekNumbers = [];
    DateTime date = startDate;
    while (date.isBefore(endDate)) {
      int weekNumber = int.parse(_getWeekNumber(date));
      weekNumbers.add(weekNumber);
      date = date.add(const Duration(days: 1));
    }

    // Return the list of week numbers
    return weekNumbers;
  }
  double checkdrowsyweek(int x){
int? y;
      // Get the current date and time
    DateTime now = DateTime.now();

    String weekNumberString = _getWeekNumber(now);

    // Parse the week number string as an integer
    int weekNumber = int.parse(weekNumberString);
      // Print the current week number
      // print('Current week number: $weekNumber');


      switch (x){
        case 0:
          y=6;
          break;
        case 1:
          y=7;
          break;
        case 2:
          y=1;
          break;
        case 3:
          y=2;
          break;
        case 4:
          y=3;
          break;
        case 5:
          y=4;
          break;
        case 6:
          y=5;
          break;



      }

    for (var i in _trips){
      if(int.parse(_getWeekNumber(i.time!))==weekNumber){
        if (i.time!.weekday==y){
          if (i.drowsinesstimes!>0){
            return 20;
          }
        }
      }
    }
    return 1;

  }



}
