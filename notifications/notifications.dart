import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//made for android only

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Notifications {
  final FlutterLocalNotificationsPlugin _fln =
      FlutterLocalNotificationsPlugin();

  var not = const NotificationDetails(
      android: AndroidNotificationDetails("channel_id_0", "Alert",
          playSound: true,
          importance: Importance.max,
          priority: Priority.high));

  static Future initialize() async {
    var androidInit =
        const AndroidInitializationSettings("@mipmap/launcher_icon");
    var initializationSettings = InitializationSettings(android: androidInit);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future showBigTextNotification(
      {int id = 0,
      required String title,
      required String body,
      var payload}) async {
    await _fln.show(id, title, body, not);
  }

  void scheduleNotificationPeriodically({
    int id = 0,
    required String title,
    required String body,
    required RepeatInterval repeatInterval,
    var payload,
  }) {
    _fln.periodicallyShow(id, title, body, repeatInterval, not);
  }
}



/*
add those two in AndroidManifest.xml
  <meta-data 
              android:name="com.google.firebase.messaging.default_notification_channel_id"
              android:value="channel_id_0"/>
           
            <!-- customed. -->
            0

            */