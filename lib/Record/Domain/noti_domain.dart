import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications {
  int? id;
  String? userId;
  DateTime? date;
  int? tripId;

  Notifications({
    this.id,
    this.userId,
    this.date,
    this.tripId,
  });

  Map<String, dynamic> toJson() {
    return {
      'notification id': id,
      'user id': userId,
      'date': date,
      'tripid': tripId,
    };
  }

  factory Notifications.fromMap(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Notifications(
      id: data['notification id'],
      userId: data['user id'],
      date: data['date']?.toDate(), // Convert timestamp to DateTime
      tripId: data['tripid'],
    );
  }
}
