import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(
    String username,
    String fullname,
    String address,
    int nationalID,
    String phonenumber,
    String emergencycontact,
    String bloodgroup,
    String owner,
    String brand,
    String color,
    String letters,
    int numbers) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.add({
    'Username': username,
    'uid': uid,
    'Fullname': fullname,
    'Address': address,
    'NationalID': nationalID,
    'PhoneNumber': phonenumber,
    'EmergencyContact': emergencycontact,
    'BloodGroup': bloodgroup,
    'vehicle': {
      'Owner': owner,
      'uid': uid,
      'Brand': brand,
      'Color': color,
      'Letters': letters,
      'Numbers': numbers
    }
  });
  // users.doc('vehicle').set({'Owner': owner, 'uid': uid, 'Brand': brand, 'Color': color, 'Letters': letters, 'Numbers': numbers });

  return;
}
// Future<void> vehicleUpdate(String owner, String brand, String color, String letters, int numbers ) async {
//   CollectionReference users = FirebaseFirestore.instance.collection('Users');
//   FirebaseAuth auth = FirebaseAuth.instance;
//   String uid = auth.currentUser!.uid.toString();
//   users.doc('vehicle').set({'Owner': owner, 'uid': uid, 'Brand': brand, 'Color': color, 'Letters': letters, 'Numbers': numbers });
//   return;
// }