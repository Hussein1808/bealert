import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'UserData.dart';

Future<String> userSetup(
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
  // FirebaseAuth auth = FirebaseAuth.instance;
  // String uid = auth.currentUser!.uid;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  users.doc(uid).collection('User Info').doc(uid).set({
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

  return uid;
}

// Future<void> vehicleUpdate(String owner, String brand, String color, String letters, int numbers ) async {
//   CollectionReference users = FirebaseFirestore.instance.collection('Users');
//   FirebaseAuth auth = FirebaseAuth.instance;
//   String uid = auth.currentUser!.uid.toString();
//   users.doc('vehicle').set({'Owner': owner, 'uid': uid, 'Brand': brand, 'Color': color, 'Letters': letters, 'Numbers': numbers });
//   return;
// }



Future<void> delete(String id) async {
  await FirebaseFirestore.instance.collection('Users').doc(id).delete();
}

Future<void> editUser(String id,Userr u) async {
  await FirebaseFirestore.instance.collection('Users').doc(id).collection("User Info").doc(id).update(u.toMap());
}

Future<Userr> getUser(String id) async {
  return await FirebaseFirestore.instance.collection('Users').doc(id).collection("User Info").doc(id). get().then((value) => Userr.fromMap(value.data()!));
}
Future<bool> findUser(String uid) async{
  return await FirebaseFirestore.instance.collection('users').where("uid",isEqualTo: uid ).get().then((value) {
    if (value.size==0)
      return false;
    else
      return true;
  });


}
