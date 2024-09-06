
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Notificationlogic extends GetxController {
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    try {
      AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
      var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
      );
      await notificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveBackgroundNotificationResponse: backgroundNotificationHandler,
      );
    } catch (e) {
      print("Notification initialization error: $e");
    }
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId', 'channelName',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
        ticker: 'ticker',
        playSound: true,
        enableLights: true,
        enableVibration: true,
        visibility: NotificationVisibility.public,
      ),
    );
  }


  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      await notificationDetails(),
    );
  }

  // Future<void> scheduleNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   required DateTime scheduleNotificationDateTime,
  // })async{
  //   return notificationsPlugin.zonedSchedule(
  //       id, title, body,
  //       tz.TZDateTime.from(
  //           scheduleNotificationDateTime,
  //           tz.local),
  //       await notificationDetails(),
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  //
  // }

}

Future<void> backgroundNotificationHandler(NotificationResponse notificationResponse) async {
  // Handle the notification response here.
  print('Notification received in background: ${notificationResponse.payload}');
}


