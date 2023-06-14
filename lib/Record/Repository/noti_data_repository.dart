import '../Domain/noti_domain.dart';
import '../Data/noti_data';

class NotificationsRepository {
  final NotificationsData notificationData = NotificationsData();

  Future<void> addNotification(Notifications notification) async {
    await notificationData.addNotification(notification);
  }

  Future<List> getNotification() async {
    return await notificationData.getNotification();
  }

  Future<void> deleteNotification() async {
    await notificationData.deleteAllNotification();
  }
}
