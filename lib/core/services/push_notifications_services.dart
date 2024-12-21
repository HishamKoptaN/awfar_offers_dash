import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notifications_services.dart';

class PushNotificationsServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    await messaging.requestPermission();

    String? token = await messaging.getToken();

    log(token ?? 'null');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    //foreground
    handleForgroundMessage();

    messaging.subscribeToTopic("all");
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification!.title ?? 'null');
  }

  static void handleForgroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //show local notificaiton
      LocalNotificationsServices.showBasicNotificaiton(
        message,
      );
    });
  }
}
