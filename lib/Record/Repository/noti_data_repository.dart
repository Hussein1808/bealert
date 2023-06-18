import '../Data/noti_data.dart';
import '../Domain/noti_domain.dart';

class NotificationsRepository {
  final NotificationsData notificationData = NotificationsData();

  Future<void> addNotification(Notifications notification) async {
    await notificationData.addNotification(notification);
  }

  Future<List<Notifications>> getNotification() async {
    return await notificationData.getNotification();
  }

  Future<void> deleteNotification() async {
    await notificationData.deleteAllNotification();
  }
}
