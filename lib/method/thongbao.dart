import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:myapp/main.dart';
import 'package:flutter/material.dart';

class FirebaseApi{
  void handleMessage(RemoteMessage? message){
    if(message == null) return;
    navigatorKey.currentState?.pushNamed
      (
      '/notification_screen',
      arguments: message,
    );
  }


  Future<void> handleBackgroundMessage(RemoteMessage message)async{
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data }');
  }
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final _firebaseMessage = FirebaseMessaging.instance;
  Future<void> initNotifications() async{
    await _firebaseMessage.requestPermission();
    final fCMToken = await _firebaseMessage.getToken();
    print('Token: $fCMToken');
    initPushNotifications();
    initLocalNotification();
  }

  final _androidChannel = const AndroidNotificationChannel(
    'high_important_channel',
    'High Important Notification',
    description: 'This channel is used for important notification ',
    importance: Importance.defaultImportance,
  );
  final _localNotification = FlutterLocalNotificationsPlugin();

  Future initPushNotifications()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert:true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if(notification == null) return;
      _localNotification.show(notification.hashCode, notification.title, notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future initLocalNotification() async{
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await  _localNotification.initialize(
        settings,
        onSelectNotification: (payload){
          final message = RemoteMessage.fromMap(jsonDecode(payload!));
          handleMessage(message);
        }
    );
    final platform = _localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);

  }


// initialize the local notifications
// static Future init() async{
//   // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/ic_launcher');
//   final DarwinInitializationSettings initializationSettingsDarwin =
//   DarwinInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload)=>   null,);
//   const LinuxInitializationSettings initializationSettingsLinux =
//   LinuxInitializationSettings(
//       defaultActionName: 'Open notification');
//   final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//       linux: initializationSettingsLinux);
//   _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: onNotificationtap,
//   onDidReceiveBackgroundNotificationResponse: onNotificationtap
//   );
// }
// //onTao Notification
// static void onNotificationtap(NotificationResponse notificationResponse){
//     navigatorKey.currentState!.pushNamed('/notification_screen', arguments: notificationResponse);
// }

// hiển thị một thông báo đơn giản
// static Future Hienthithongbao({
//     required String ten,
//   required String noiDung,
//   required String payload,
// })async{
//   const AndroidNotificationDetails androidNotificationDetails =
//   AndroidNotificationDetails('your channel id', 'your channel name',
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker');
//   const NotificationDetails notificationDetails =
//   NotificationDetails(android: androidNotificationDetails);
//   await _flutterLocalNotificationsPlugin.show(
//       0, ten, noiDung, notificationDetails, payload:payload);
// }

}