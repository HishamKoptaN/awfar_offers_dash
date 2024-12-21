import '../../features/notifications/data/model/notification.dart';

class NotificationsSingleton {
  List<Notification> _notifications = [];
  static final NotificationsSingleton _instance =
      NotificationsSingleton._internal();

  NotificationsSingleton._internal();

  static NotificationsSingleton get instance => _instance;

  List<Notification> get notifications => _notifications;

  set notifications(List<Notification> notificationsList) {
    _notifications = notificationsList;
  }

  Future<void> add({
    required Notification notification,
  }) async {
    _instance.notifications.add(
      notification,
    );
  }

  Future<void> replace({
    required Notification notification,
  }) async {
    final index =
        _instance.notifications.indexWhere((c) => c.id == notification.id);
    if (index != -1) {
      _instance.notifications[index] = notification;
    } else {
      throw Exception('${notification.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.notifications.removeWhere(
      (item) => item.id == id,
    );
  }

  void clear() {
    _notifications = [];
  }
}
