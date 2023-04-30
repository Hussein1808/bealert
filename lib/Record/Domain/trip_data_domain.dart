import 'package:cloud_firestore/cloud_firestore.dart';

class Trips {
  int? id;
  String? userid;
  DateTime? date;
  double? distance;
  DateTime? time;
  int? drowsinesstimes;

  Trips({
    this.id,
    this.userid,
    this.date,
    this.distance,
    this.time,
    this.drowsinesstimes,
  });

  Map<String, dynamic> toJson() {
    return {
      'trip id': id,
      'user id': userid,
      'date': date,
      'distance': distance,
      'time': time,
      'drowsinesstimes': drowsinesstimes,
    };
  }

  factory Trips.fromMap(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Trips(
      id: data['trip id'],
      userid: data['user id'],
      date: data['date']?.toDate(), // Convert timestamp to DateTime
      distance: data['distance'],
      time: data['time']?.toDate(),
      drowsinesstimes: data['drowsinesstimes'],
    );
  }
}
