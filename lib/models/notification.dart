// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class Notifications {
//   void initializeNotifications({
//     String name = "",
//     String description = "",
//   }) {
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();

//     final AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('app_icon');

//     final IOSInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//     );
//     InitializationSettings initializationSettings = InitializationSettings(
//         android: androidInitializationSettings, iOS: initializationSettingsIOS);

//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high channel',
//       name,
//       description: description,
//       enableVibration: true,
//       importance: Importance.max,
//       playSound: true,
//     );

//     flutterLocalNotificationsPlugin.show(
//       0,
//       channel.name,
//       channel.description,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channelDescription: channel.description,
//           enableVibration: true,
//           enableLights: true,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/kiitmun');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(
      int id, String title, String body, int hours, int minutes) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      // tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      tz.TZDateTime.from(DateTime.parse("2022-09-04 00:00:00"), tz.local)
          .add(Duration(hours: hours, minutes: minutes)),
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: 'Main channel notifications',
            importance: Importance.max,
            priority: Priority.max,
            icon: '@drawable/kiitmun'),
        iOS: IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
    print("Time done");
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
