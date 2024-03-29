import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Domain/noti_domain.dart';

class NotificationsData {
  final CollectionReference _notificationCollection =
      FirebaseFirestore.instance.collection('notification');
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addNotification(Notifications notification) async {
    try {
      // Get the current user's UID
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('userNotifications')
          .add(notification.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<List<Notifications>> getNotification() async {
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  final notificationQuerySnapshot = await FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('userNotifications')
      .get();

  final notificationData = notificationQuerySnapshot.docs
      .map((e) => Notifications.fromMap(e))
      .toList();
  return notificationData;
}


  Future<void> deleteAllNotification() async {
    try {
      final notificationQuerySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('userNotifications')
          .get();

      final batch = FirebaseFirestore.instance.batch();
      notificationQuerySnapshot.docs.forEach((doc) {
        batch.delete(doc.reference);
      });
      await batch.commit();
    } catch (e) {
      print(e);
    }
  }
}