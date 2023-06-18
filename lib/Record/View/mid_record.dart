import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bealert/Const/constants.dart';
import 'package:bealert/Record/Providers/distance_providers.dart';
import 'package:bealert/Routing/app_routing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../Common_widgets/containerr.dart';
import '../../Common_widgets/textt.dart';
import '../Domain/noti_domain.dart';
import '../Domain/trip_data_domain.dart';
import '../Providers/drowsiness_provider.dart';
import '../Repository/noti_data_repository.dart';
import '../Repository/trip_data_repo.dart';
import '../api/notification_api.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MidRecord extends StatefulWidget {
  const MidRecord({Key? key}) : super(key: key);

  @override
  _MidRecordState createState() => _MidRecordState();
}

class _MidRecordState extends State<MidRecord>
    with SingleTickerProviderStateMixin {
  late LatLng _initialPosition = const LatLng(0, 0);
  late GoogleMapController _controller;
  Completer<GoogleMapController> mapController = Completer();
  double zoomlvl = 16;
  late StreamSubscription<Position> _positionStreamSubscription;
  double _distanceTravelled = 0;
  Position? _previousPosition;
  bool start = false;
  bool choose = true;
  bool _ispaused = true;
  int noti = 0;
  int c=0;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  late CustomTimerController _tcontroller = CustomTimerController(
      vsync: this,
      begin: Duration(hours: 0, minutes: 0, seconds: 0),
      end: Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds);
  int? valueFromFirebase;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    Noti.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  void dispose() {
    _positionStreamSubscription.cancel();
    _tcontroller.dispose();
    mapController = Completer();
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
          // GestureDetector(
          //   child: Text(
          //     'Distance Travelled: ${_distanceTravelled.toStringAsFixed(2)} kilometers',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20.0,
          //     ),
          //   ),
          //   onTap: () {},
          // ),
          Expanded(
            flex: 12,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: zoomlvl,
              ),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                if(!mapController.isCompleted){
                  mapController.complete(controller);
                }
              },
            ),
          ),
          Expanded(
            child: Center(
              child: CustomTimer(
                  controller: _tcontroller,
                  builder: (state, time) {
                    return Text("${time.hours}:${time.minutes}:${time.seconds}",
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold));
                  }),
            ),
          ),
          Expanded(
            flex: 2,
            child: Containerr(
                w: screenwidth,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 2.0,
                  ),
                )),
                child: start
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          choose
                              ? SizedBox(
                                  width: screenwidth * 0.25,
                                  child: FloatingActionButton(
                                    elevation: 0.0,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
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
                                          type: AnimatedSnackBarType.warning,
                                          mobileSnackBarPosition:
                                              MobileSnackBarPosition.top,
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
                                            AnimatedSnackBar.material(
                                              'Trip resumed',
                                              type:
                                                  AnimatedSnackBarType.warning,
                                              mobileSnackBarPosition:
                                                  MobileSnackBarPosition.top,
                                              desktopSnackBarPosition:
                                                  DesktopSnackBarPosition
                                                      .topCenter,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                            ).show(context);
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
                                          size: screenwidth * 0.025,
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
                                            final tripid = 1;
                                            final newTrip = Trips(
                                              id: tripid, // or generate a unique id
                                              userid: uid,
                                              date: now,
                                              distance: double.parse(
                                                  _distanceTravelled
                                                      .toStringAsFixed(2)),
                                              time: total_time,
                                              drowsinesstimes: counter,
                                            );
                                            TripsRepository().addTrip(
                                                newTrip); // add the trip to the database
                                            AnimatedSnackBar.material(
                                              'Trip Saved',
                                              type:
                                                  AnimatedSnackBarType.warning,
                                              mobileSnackBarPosition:
                                                  MobileSnackBarPosition.top,
                                              desktopSnackBarPosition:
                                                  DesktopSnackBarPosition
                                                      .bottomLeft,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                            ).show(context);
                                            _tcontroller.reset();
                                            _distanceTravelled = 0;
                                            total_time = DateTime.now();
                                            start = false;
                                            choose = true;
                                          });
                                        },
                                        child: Textt(
                                          text: 'FINISH',
                                          color: Theme.of(context).primaryColor,
                                          weight: FontWeight.w900,
                                          size: screenwidth * 0.025,
                                        ),
                                      ),
                                    ),
                                    // const SizedBox(
                                    //   width: 20,
                                    // ),
                                    // SizedBox(
                                    //   width: screenwidth * 0.235,
                                    //   child: FloatingActionButton(
                                    //     elevation: 0.0,
                                    //     backgroundColor: Theme.of(context)
                                    //         .colorScheme
                                    //         .secondary,
                                    //     onPressed: () async {
                                    //       // Create the notification details
                                    //       // Schedule the alarm to trigger in 5 seconds
                                    //       // AndroidAlarmManager.oneShot(
                                    //       //   const Duration(seconds: 5),
                                    //       //   0,
                                    //       //   () => playAlarm(),
                                    //       // );

                                    //       GoRouter.of(context)
                                    //           .push('/warning');
                                    //       Noti.showBigTextNotification(
                                    //           title: "Warning ",
                                    //           body:
                                    //               " drowsiness detected Take a break ",
                                    //           fln:
                                    //               flutterLocalNotificationsPlugin);
                                    //       FlutterRingtonePlayer.play(
                                    //         android: AndroidSounds.ringtone,
                                    //         ios: IosSounds.alarm,
                                    //         looping:
                                    //             true, // Android only - API >= 28
                                    //         volume:
                                    //             5.0, // Android only - API >= 28
                                    //         asAlarm:
                                    //             true, // Android only - all APIs
                                    //       );
                                    //     },
                                    //     child: Textt(
                                    //       text: 'Test',
                                    //       color:
                                    //           Theme.of(context).primaryColor,
                                    //       weight: FontWeight.w900,
                                    //       size: 16.0,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                        ],
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
                                  MobileSnackBarPosition.top,
                              desktopSnackBarPosition:
                                  DesktopSnackBarPosition.bottomLeft,
                              duration: const Duration(milliseconds: 300),
                            ).show(context);
                          });
                        },
                        child: Textt(
                          text: 'Start',
                          size: screenwidth * 0.045,
                          color: Theme.of(context).primaryColor,
                          weight: FontWeight.w700,
                        ),
                      )),
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
      //     geturl(position.latitude,position.longitude);
      //     print("latitude"+position.latitude.toString());
      //     print("longitude"+position.longitude.toString());
      if (_ispaused == false) {
        if (_previousPosition != null) {
          getData();
          // print(valueFromFirebase ??= 0);
          valueFromFirebase ??= 0;
          if (valueFromFirebase == 0) {
            noti = 1;
            FlutterRingtonePlayer.stop();
          }
          if (valueFromFirebase == 1 && noti == 1) {
            noti = 0;
            FlutterRingtonePlayer.stop();

            counter++;
            Noti.showBigTextNotification(
                title: "Warning ",
                body: " drowsiness detected Take a break ",
                fln: flutterLocalNotificationsPlugin);
            final now = DateTime.now();

            final newnotification = Notifications(
              id: 1,
              userId: uid,
              date: now,
              tripId: counter,
            );
            NotificationsRepository().addNotification(newnotification); // add
          }
          if (valueFromFirebase == 2) {
            noti = 1;
            counter++;
            router.go('/warning');
            FlutterRingtonePlayer.play(
              android: AndroidSounds.ringtone,
              ios: IosSounds.alarm,
              looping: true, // Android only - API >= 28
              volume: 5.0, // Android only - API >= 28
              asAlarm: true, // Android only - all APIs
            );
          }
           // back end code for sending msg to emergency contact
            if( valueFromFirebase == 3){

              if(c==0){
                sending_SMS([currUser!.emergencycontact],geturl(position.latitude,position.longitude));
                c++;
                Noti.showBigTextNotification(
                    title: "Warning ",
                    body: " emergency contacts notified of current location ",
                    fln: flutterLocalNotificationsPlugin);
                final now = DateTime.now();
                counter++;
                final newnoti = Notifications(
                  id: 1,
                  userId: uid,
                  date: now,
                  tripId: counter,
                );
                NotificationsRepository().addNotification(newnoti);
              }
else{  router.go('/warning');
              FlutterRingtonePlayer.play(
                android: AndroidSounds.ringtone,
                ios: IosSounds.alarm,
                looping: true, // Android only - API >= 28
                volume: 5.0, // Android only - API >= 28
                asAlarm: true, // Android only - all APIs
              ); }

              noti = 1;



            }

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
            context
                .read<Drowsiness>()
                .updatedrowsiness(valueFromFirebase.toString());
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

  Future<int?> getData() async {
    var a = await FirebaseFirestore.instance
        .collection('classifications')
        .doc("1")
        .get();
    setState(() {
      valueFromFirebase = a['classification'];
    });
  }
  void sending_SMS( List<String> list_receipents,String url) async {
    String name=currUser!.fullname;
    final message =
        "BeAlert: This is an automated message. $name is drowsy while sleeping and doesn't want to wake up. Please call emergency services immediately. Here is the $name's location: $url";
    print(message);
    String send_result = await sendSMS(message: message, recipients: list_receipents)
        .catchError((err) {
      print(err);
    });

    print(send_result);
  }
  String geturl(double latitude, double longitude) {
    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    // print(url);
    return url;
  }
  // void playAlarm() {
  //   // Play the alarm sound
  //   FlutterRingtonePlayer.play(
  //     android: AndroidSounds.alarm,
  //     ios: IosSounds.horn,
  //     looping: false, // Set to true if you want the alarm to loop
  //     volume: 5.0, // Set the alarm volume (0.0 - 1.0)
  //   );
  // }
}
