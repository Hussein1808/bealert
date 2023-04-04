import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String username, String fullname, String address, int nationalID, String phonenumber, String emergencycontact, String bloodgroup ) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.add({'Username': username, 'uid': uid, 'Fullname': fullname, 'Address': address, 'NationalID': nationalID, 'PhoneNumber': phonenumber, 'EmergencyContact': emergencycontact, 'BloodGroup': bloodgroup });
  return;
}