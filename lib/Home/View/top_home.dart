import 'package:bealert/Common_widgets/containerr.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/time.dart';
import 'package:swipe/swipe.dart';
import 'package:unicons/unicons.dart';
import '../../Common_widgets/textt.dart';
import '../../Record/Domain/trip_data_domain.dart';
import '../../Record/Repository/trip_data_repo.dart';

class TopHome extends StatefulWidget {
  const TopHome({super.key});

  @override
  State<TopHome> createState() => _TopHomeState();
}

class _TopHomeState extends State<TopHome> {
  // final DateFormat _dateFormatter = DateFormat.MMMEd();
  // late var months = DateFormat.M().format(DateTime.now());
  final TripsRepository _repository = TripsRepository();
  List<Trips> _trips = [];
  late var daysinmonth = daysInMonth(DateTime.now().year, DateTime.now().month);

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

  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Swipe(
        onSwipeUp: () {
          GoRouter.of(context).go('/home/1');
          print('object');
        },
        //* Top yellow container
        child: Stack(
          children: [
            Containerr(
              w: screenwidth,
              h: screenheight * 0.30,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).splashColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Your Drowsy Days
                    const Expanded(flex: 4, child: SizedBox.shrink()),
                    //* Number of Days in month
                    Expanded(
                      flex: 8,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Textt(
                                text: checkdrowsy().toString()??'0',
                                font: GoogleFonts.righteous,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                size: screenwidth * 0.18,
                              ),
                            ],
                          ),
                          //* days in month
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 8.0),
                            child: Column(
                              children: [
                                Textt(
                                  text: '/$daysinmonth',
                                  font: GoogleFonts.righteous,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  size: screenwidth * 0.1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Textt(
                                text: 'View History',
                                font: GoogleFonts.roboto,
                                color: Theme.of(context).primaryColor,
                                size: screenwidth * 0.04,
                                weight: FontWeight.bold,
                              ),
                              Icon(
                                UniconsLine.angle_up,
                                color: Theme.of(context).primaryColor,
                                size: 32.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21.0),
              child: Containerr(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                w: screenwidth * 0.73,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Textt(
                        text: 'Your Drowsy Days',
                        font: GoogleFonts.roboto,
                        color: Theme.of(context).colorScheme.primary,
                        size: screenwidth * 0.05,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  int checkdrowsy(){
    int counter=0;

    for (var i in _trips){
     if (i.time!.month==DateTime.now().month){

        if (i.drowsinesstimes!>0){
          counter++;
        }

      }
    }
    return counter;

  }
}
