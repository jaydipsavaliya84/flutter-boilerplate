import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/utils/services/debug.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppNotificationHandler {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: AndroidInitializationSettings("@drawable/ic_launcher"),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
        requestSoundPermission: true,
        requestBadgePermission: true,
      ),
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: (NotificationResponse res) {
        devLog(
            "onDidReceiveBackgroundNotificationResponse  ${res.payload}    ");
      },
      onDidReceiveNotificationResponse: (NotificationResponse res) {
        devLog("onDidReceiveNotificationResponse  ${res.payload}    ");
      },
    );
  }

  /// FIREBASE NOTIFICATION SETUP
  static Future<void> firebaseNotificationSetup() async {
    ///firebase initialize
    await Firebase.initializeApp();

    ///local notification...
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    ///IOS Setup
    DarwinInitializationSettings initializationSettings =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.initialize(initializationSettings);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    // Update the iOS foreground notification presentation options to allow
    // heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    ///Get FCM Token..
    await getFcmToken();
  }

  ///background notification handler..
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    devLog("-==========*-*--*-*-*-*-*-**--*  ${message.notification}");
    devLog("-==========*-*--*-*-*-*-*-**--*  ${message.data}");
    if (message.data['type'] == "yes") {
    } else {}

    debugPrint('Handling a background message ${message.messageId}');
  }

  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    "high_importance_channel", // id
    'high_importance_channel', // title
    description: "high_importance_channel", // description
    importance: Importance.high,
    playSound: true,
  );

  ///get fcm token
  static Future<void> getFcmToken() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    try {
      String? token;
      firebaseMessaging.getToken().then((value) {
        token = value;
        devLog("fcm-token :  $token");
      }).catchError((e) {
        devLog("=========fcm- Error ....:$e");
      });
    } catch (e) {
      devLog("=========fcm- Error :$e");
      return;
    }
  }

  ///call when app in fore ground
  static Future<void> showMsgHandler() async {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        RemoteNotification? notification = message.notification;

        devLog("-=-=-=-=-$message");
        showMsg(notification!, message.data);
      },
      onDone: () {
        devLog("on tap ++++++++++++++");
      },
      onError: (s, o) {
        devLog("on tap error+++++++++++++ $o   $s   $o");
      },
    ).onError((e) {
      devLog('Error Notification : ....$e');
    });
  }

  /// handle notification when app in fore ground..
  static void getInitialMsg() {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      devLog(
          'tap on notification =========  $message  =======================');
    });
  }

  ///show notification msg
  static void showMsg(
    RemoteNotification notification,
    Map<String, dynamic> time,
  ) async {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "high_importance_channel", // id
          'high_importance_channel', // title
          channelDescription: "high_importance_channel",
          importance: Importance.high,
          priority: Priority.high,
          icon: '@drawable/ic_launcher',
          playSound: true,
        ),
      ),
    );
  }

  ///call when click on notification
  static onMsgOpen() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (
        RemoteMessage message,
      ) async {
        devLog("-=-=-1=-=-${message.notification!.title}");
        devLog("-=-=-1=-=-${message.notification!.body}");
      },
      onDone: () {
        devLog("on tap");
      },
      onError: (s, o) {
        devLog("on tap error   $s   $o");
      },
    );
  }
}
