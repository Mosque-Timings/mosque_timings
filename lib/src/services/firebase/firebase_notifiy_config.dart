import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FirebaseNotifyConfig {


  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
     const AndroidInitializationSettings('notify_icon');
  var initializationSettingsIOS = const IOSInitializationSettings();

  Future<void> subscribeTo(String topic) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.subscribeToTopic(topic);
  }

  Future<void> initialize() async {

    if (await configDone()) {
      await listenToNotify();
    } else {
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
      flutterLocalNotificationsPlugin.initialize(initializationSettings);

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await subscribeTo('timeChangesTest');

      await registerConfig();
      await listenToNotify();
    }
  }

  Future<void> listenToNotify() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        await flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: android.smallIcon,
                // other properties...
              ),
            ));
      }
    });
  }

  Future<void> registerConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firebase_notify_config_test3', true);
  }

  Future<bool> configDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firebase_notify_config_test3') ?? false;
  }

  // void _handleMessage(RemoteMessage message) {
  //   if (message.data['type'] == 'chat') {
  //
  //   }
  // }

// await messaging.
// setForegroundNotificationPresentationOptions( alert: true, // Required to display a heads up notification
//   badge: true,
//   sound: true,);

// NotificationSettings settings = await messaging.requestPermission(
//   alert: true,
//   announcement: false,
//   badge: true,
//   carPlay: false,
//   criticalAlert: false,
//   provisional: false,
//   sound: true,
// );
}
