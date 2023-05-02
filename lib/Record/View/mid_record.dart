import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bealert/Record/Providers/distance_providers.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../Common_widgets/containerr.dart';
import '../../Common_widgets/textt.dart';
import '../Domain/trip_data_domain.dart';
import '../Repository/trip_data_repo.dart';

class MidRecord extends StatefulWidget {
  const MidRecord({Key? key}) : super(key: key);

  @override
  _MidRecordState createState() => _MidRecordState();
}

class _MidRecordState extends State<MidRecord>
    with SingleTickerProviderStateMixin {
  late LatLng _initialPosition = const LatLng(0, 0);
  late GoogleMapController _controller;
  double zoomlvl = 16;
  late StreamSubscription<Position> _positionStreamSubscription;
  double _distanceTravelled = 0;
  Position? _previousPosition;
  bool start = false;
  bool choose = true;
  bool _ispaused = true;
  late CustomTimerController _tcontroller = CustomTimerController(
      vsync: this,
      begin: Duration(hours: 0, minutes: 0, seconds: 0),
      end: Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds);

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  void dispose() {
    _positionStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    String? _userId;
    DateTime? _date;
    double? _distance;
    Duration? _time;
    int? _drowsinessTimes;
    DateTime now;

    DateTime total_time = DateTime.now();
    ;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Text(
              'Distance Travelled: ${_distanceTravelled.toStringAsFixed(2)} kilometers',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: zoomlvl,
              ),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
          ),
          Column(
            children: [
              CustomTimer(
                  controller: _tcontroller,
                  builder: (state, time) {
                    // Build the widget you want!🎉
                    // total_time = DateTime(
                    //     int.parse(time.hours), int.parse(time.minutes));
                    return Text("${time.hours}:${time.minutes}:${time.seconds}",
                        style:const  TextStyle(fontSize: 24.0));
                  }),
              Containerr(
                  w: screenwidth,
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 2.0,
                    ),
                  )),
                  child: start
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              choose
                                  ? SizedBox(
                                      width: screenwidth * 0.25,
                                      child: FloatingActionButton(
                                        elevation: 0.0,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        onPressed: () {
                                          setState(() {
                                            _tcontroller.pause();
                                            choose = false;
                                            // context
                                            //     .read<Pause>()
                                            //     .paused(_ispaused = false);
                                            _ispaused = true;
                                            print('$_ispaused');
                                            AnimatedSnackBar.material(
                                              'Paused',
                                              type:
                                                  AnimatedSnackBarType.warning,
                                              mobileSnackBarPosition:
                                                  MobileSnackBarPosition.bottom,
                                              desktopSnackBarPosition:
                                                  DesktopSnackBarPosition
                                                      .bottomLeft,
                                              duration:
                                                  const Duration(milliseconds: 300),
                                            ).show(context);
                                          });
                                        },
                                        child: Icon(Icons.square,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            size: 35),
                                      ),
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  width: 3,
                                                  style: BorderStyle.solid)),
                                          width: screenwidth * 0.235,
                                          child: FloatingActionButton(
                                            elevation: 0.0,
                                            backgroundColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            onPressed: () {
                                              setState(() {
                                                _tcontroller.start();
                                                choose = true;
                                                // context
                                                //     .read<Pause>()
                                                //     .paused(_ispaused = false);
                                                _ispaused = false;
                                              });
                                            },
                                            child: Textt(
                                              text: 'RESUME',
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              weight: FontWeight.w900,
                                              size: 16.0,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: screenwidth * 0.235,
                                          child: FloatingActionButton(
                                            elevation: 0.0,
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            onPressed: () {
                                              setState(() {
                                                now = DateTime.now();
                                                //*------------------------------------------- Back end code
                                                final newTrip = Trips(
                                                  id: 1, // or generate a unique id
                                                  userid: 'dasda',
                                                  date: now,
                                                  distance: double.parse(
                                                      _distanceTravelled
                                                          .toStringAsFixed(2)),
                                                  time: total_time,
                                                  drowsinesstimes: 5,
                                                );
                                                TripsRepository().addTrip(
                                                    newTrip); // add the trip to the database
                                                _tcontroller.reset();
                                                _distanceTravelled = 0;
                                                total_time = DateTime.now();
                                                start = false;
                                                choose = true;
                                              });
                                            },
                                            child: Textt(
                                              text: 'FINISH',
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              weight: FontWeight.w900,
                                              size: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        )
                      : FloatingActionButton(
                          elevation: 0.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            setState(() {
                              _tcontroller.start();
                              // context.read<Pause>().paused(_ispaused = false);
                              _ispaused = false;
                              start = true;
                              AnimatedSnackBar.material(
                                'Trip started',
                                type: AnimatedSnackBarType.warning,
                                mobileSnackBarPosition:
                                    MobileSnackBarPosition.bottom,
                                desktopSnackBarPosition:
                                    DesktopSnackBarPosition.bottomLeft,
                                duration: const Duration(milliseconds: 300),
                              ).show(context);
                            });
                          },
                          child: Textt(
                            text: 'Start',
                            color: Theme.of(context).primaryColor,
                            weight: FontWeight.w700,
                          ),
                        )),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
          'Location permissions are denied (actual value: $permission).',
        );
      }
    }

    position = await Geolocator.getCurrentPosition();
    _initialPosition = LatLng(position.latitude, position.longitude);
    // bool _paused = Provider.of<Pause>(context, listen: false).p;
    // print('$_paused');
    _positionStreamSubscription =
        Geolocator.getPositionStream().listen((position) {
      // print('-------------------------------$_paused');

      if (_ispaused == false) {
        if (_previousPosition != null) {
          var distance = Geolocator.distanceBetween(
            _previousPosition!.latitude,
            _previousPosition!.longitude,
            position.latitude,
            position.longitude,
          );
          setState(() {
            _distanceTravelled += distance / 1000;
            context
                .read<Distance>()
                .updatedistance(_distanceTravelled.toStringAsFixed(2));
          });
        }
      }
      _previousPosition = position;

      _initialPosition = LatLng(position.latitude, position.longitude);
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _initialPosition,
            zoom: zoomlvl,
          ),
        ),
      );
    });
  }
}
