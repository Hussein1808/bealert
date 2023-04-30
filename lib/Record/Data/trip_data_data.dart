import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Domain/trip_data_domain.dart';

class TripsData {
  final CollectionReference _tripsCollection =
      FirebaseFirestore.instance.collection('trips');
      final uid = FirebaseAuth.instance.currentUser!.uid;


  Future<void> addTrip(Trips trip) async {
    try {
      // Get the current user's UID

      // Add the new trip document to the userTrips sub-collection of the current user's document
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('userTrips')
          .add(trip.toJson());
    } catch (e) {
      print(e);
    }
  }
  
  Future<List<Trips>> getTrips() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    
      final tripsQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('userTrips')
          .get();

      final tripsData = tripsQuerySnapshot.docs.map((e) =>Trips.fromMap(e)).toList();
      return tripsData;
          
          
    
  }
}

