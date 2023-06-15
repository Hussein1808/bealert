
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Common_widgets/textt.dart';
import '../../Record/Domain/trip_data_domain.dart';
import '../../Record/Repository/trip_data_repo.dart';

class BottomTrip extends StatefulWidget {
  final date;
  const BottomTrip({super.key,
  required this.date});

  @override
  State<BottomTrip> createState() => _BottomTripState(date: date,);
}

class _BottomTripState extends State<BottomTrip> {
  final date;
  _BottomTripState({
    required this.date,
  }) : super();
  final TripsRepository _repository = TripsRepository();
  List<Trips> _trips = [];
  List<Color> gradientColors = const [
    Color(0xFF009fff),
    Color(0xFFec2f4b),
  ];

  bool showAvg = false;
  Future<void> _getTrips() async {
    final trip=await _repository.getTrips();
    setState(() {
      _trips = trip;
    });

  }
  @override
  void initState() {
    _getTrips();

  }
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          BlurryContainer(
            blur: 5,
            width: screenwidth * 1,
            height: screenheight * 0.40,
            elevation: 0,
            color:  const Color.fromARGB(140, 229, 229, 229),
            padding: const EdgeInsets.all(8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Textt(
                              text: 'Drowsy Driving',
                              font: GoogleFonts.roboto,
                              color: Theme.of(context).colorScheme.primary,
                              weight: FontWeight.bold,
                              size: 26.0,
                            ),
                            Textt(
                              text: 'Non-attentive Driving time',
                              font: GoogleFonts.roboto,
                              color: Theme.of(context).colorScheme.primary,
                              weight: FontWeight.normal,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: AspectRatio(
                            aspectRatio: 1.70,
                            child: LineChart(
                              mainData(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Theme.of(context).secondaryHeaderColor);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('12', style: style);
        break;
      case 2:
        text = Text('2', style: style);
        break;
      case 4:
        text = Text('4', style: style);
        break;
      case 6:
        text = Text('6', style: style);
        break;
      case 8:
        text = Text('8', style: style);
        break;
      case 10:
        text = Text('10', style: style);
        break;
      case 12:
        text = Text('12', style: style);
        break;

      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Theme.of(context).secondaryHeaderColor);

    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;

      case 5:
        text = '50%';
        break;
      case 10:
        text = '100%';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
              left:
                  BorderSide(color: Theme.of(context).primaryColor, width: 0.3),
              bottom: BorderSide(
                  color: Theme.of(context).primaryColor, width: 0.3))),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots:  [
            FlSpot(0, checkdrowsy(0)),
            FlSpot(1, checkdrowsy(1)),
            FlSpot(2, checkdrowsy(2)),
            FlSpot(3, checkdrowsy(3)),
            FlSpot(4, checkdrowsy(4)),
            FlSpot(5, checkdrowsy(5)),
            FlSpot(6, checkdrowsy(6)),
            FlSpot(7, checkdrowsy(7)),
            FlSpot(8, checkdrowsy(8)),
            FlSpot(9, checkdrowsy(9)),
            FlSpot(10, checkdrowsy(10)),
            FlSpot(11, checkdrowsy(11)),
            FlSpot(12, checkdrowsy(12)),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
  double checkdrowsy(int x){

    for (var i in _trips){
      if(i.time!.day ==date.day){
        if (i.time!.hour%12==x){
          if (i.drowsinesstimes!>0){
            return 10;
          }
        }
      }
    }
    return 1;

  }
}
