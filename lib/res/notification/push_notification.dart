
// import 'dart:developer';
// import 'package:weather_app/res/notification/alarm/alarm_awesome.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import '../configuration/print_types.dart';

// // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //     FlutterLocalNotificationsPlugin();

// class PushNotificationsManager {
//   PushNotificationsManager._();

//   factory PushNotificationsManager() => _instance;

//   static final PushNotificationsManager _instance =
//       PushNotificationsManager._();

//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

// /*  final notificationController = Get.isRegistered<FcmNotificationController>()
//       ? Get.put(FcmNotificationController())
//       : Get.find<FcmNotificationController>();*/

//   bool showNotification = true;

//   subscribe(String id) {
//     sPrint.info('alarm:: $id');
//     firebaseMessaging.subscribeToTopic(id);
//   }

//   unSubscribe(String id) {
//     firebaseMessaging.unsubscribeFromTopic(id);
//   }

//   getNotification() {
//     FirebaseMessaging.onMessage.listen(
//       (RemoteMessage message) {
//         sPrint.info('getMessage::: $message');
//         RemoteNotification? notification = message.notification;
        
//          if (message.data['type'] != null &&
//             message.data['type'] == 'alarm') {
//              // Platform.isAndroid?
//               // CustomAlarmAwesome.showAlarmNotification(
//               // title: message.data['title'],
//               // message: message.data['body'],
//               // id: message.data['id']);
//               log("payload foreground ${message.data}");
//               log("weather_app message just showed up :  ${message.notification?.toMap()}");
//           //showToast("alarmmm", MessageErrorType.success);
//           // CustomAlarm.showAlarmNotification(
//           //     title: message.data['title'],
//           //     message: message.data['body'],
//           //     id: message.data['id']);
//           //     print("alarmmmmmmmmmmmmm ${message.data['title']}");
//         } else if (notification != null) {
//           // foreground
//           sPrint.info('notificationMessage::::${message.notification!.title}');
//           sPrint.info('notificationMessage::::${message.notification!.body}');
//           sPrint.info('notificationMessageData::::${message.data}');
//           var notificationController; //= Get.put(NotificationController());
//           notificationController?.updateFirebaseNotification(true);
//           // showNotificationSnackBar(
//           //   payload: "",
//           //   title: message.notification?.title ?? "",
//           //   message: message.notification?.body ?? "",
//           //   onReceive: (p0) {},
//           // );
//           print("testyyyyyyyyyyyyyyyy ${message.notification?.title}");
//         }
//       },
//     );

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       sPrint.info('getMessage::: $message');
//       RemoteNotification? notification = message.notification;
//       if (notification != null) {
//         // back ground click
//         sPrint.info('notificationMessage::::${message.notification!.title}');
//         sPrint.info('notificationMessage::::${message.notification!.body}');
//         sPrint.info('notificationMessageData::::${message.data}');
//         // notificationController.getNotificationData(message.data);
//       }
//     });
//     sPrint.info('start request permission');
//     firebaseMessaging.requestPermission(
//         sound: true, badge: true, alert: true, provisional: true);
//   }

//   Future<void> requestNotificationPermissions() async {
//     final settings = await firebaseMessaging.getNotificationSettings();
//     if (settings.authorizationStatus != AuthorizationStatus.authorized) {
//       await firebaseMessaging.requestPermission();
//     }
//   }

//   // void _launchPowerUsageSettings() async {
//   //   const url =
//   //       'package:com.android.settings/com.android.settings.fuelgauge.PowerUsageSummary';

//   //   if (await canLaunch(url)) {
//   //     await launch(url);
//   //   } else {
//   //     throw 'Could not launch $url';
//   //   }
//   // }

//   // Future<String?> getNotificationToken() {
//   //   return firebaseMessaging.getToken().then((String? token) {
//   //     sPrint.info('token - fcm token :: //$token//');
//   //     return token;
//   //   });
//   // }

//   Future<String?> getNotificationToken() async {
//   try {
//     String? token = await FirebaseMessaging.instance.getToken();
//     sPrint.info('📱 FCM token: $token');
//       return token;
//   } catch (e) {
//     print('❌ Error getting FCM token: $e');
//     return null;
//   }
// }


//   // static void showNotificationSnackBar({
//   //   required String title,
//   //   required String message,
//   //   required String payload,
//   //   required void Function(NotificationResponse) onReceive,
//   // }) async {
//   //   /*Get.snackbar(title, message,
//   //       icon: icon, onTap: onTap, duration: const Duration(seconds: 3));*/

//   //   bool? showNotification = await flutterLocalNotificationsPlugin
//   //       .resolvePlatformSpecificImplementation<
//   //           AndroidFlutterLocalNotificationsPlugin>()
//   //       ?.requestNotificationsPermission();
//   //   sPrint.info('show notification:: $showNotification');
//   //   if (showNotification == true) {
//   //     LocalNotification.showBigTextNotification(
//   //         title: title,
//   //         body: message,
//   //         fln: flutterLocalNotificationsPlugin,
//   //         payload: payload);
//   //   } else {
//   //     Get.snackbar(title, message, duration: const Duration(seconds: 3));
//   //   }
//   // }
// }

// class LocalNotification {
//   // static Future initialize(
//   //     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
//   //     void Function(NotificationResponse) onReceive) async {
//   //   var initializationsSettings = const InitializationSettings(
//   //       android: AndroidInitializationSettings('mipmap/ic_launcher'),
//   //       iOS: DarwinInitializationSettings());
//   //   await flutterLocalNotificationsPlugin.initialize(initializationsSettings,
//   //       onDidReceiveBackgroundNotificationResponse: onReceive,
//   //       onDidReceiveNotificationResponse: onReceive);
//   // }

//   // static Future showBigTextNotification(
//   //     {var id = 0,
//   //     required String title,
//   //     required String body,
//   //     var payload,
//   //     required FlutterLocalNotificationsPlugin fln}) async {
//   //   AndroidNotificationDetails androidPlatformChannelSpecifics =
//   //       AndroidNotificationDetails(
//   //     title,
//   //     'com.mint.android',
//   //     playSound: true,
//   //     //   sound: const RawResourceAndroidNotificationSound('notification'),
//   //     importance: Importance.max,
//   //     priority: Priority.high,
//   //     icon: '@mipmap/ic_launcher',
//   //     largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
//   //   );

//   //   var not = NotificationDetails(
//   //       android: androidPlatformChannelSpecifics,
//   //       iOS: const DarwinNotificationDetails());
//   //   await fln.show(id, title, body, not, payload: payload);
//   // }

//   static requestAlarmNotification() {
//    // Permission.scheduleExactAlarm.request();
//    // Permission.criticalAlerts.request();
//   }
// }









































// // import 'dart:io';

// // import 'package:weather_app/data/const/export.dart';
// // import 'package:weather_app/features/notification/domain/controller/notification_controller.dart';
// // import 'package:weather_app/res/notification/alarm/alarm.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:awesome_notifications/awesome_notifications.dart';
// // import 'package:get/get.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // import '../configuration/print_types.dart';

// // class PushNotificationsManager {
// //   PushNotificationsManager._();

// //   factory PushNotificationsManager() => _instance;

// //   static final PushNotificationsManager _instance = PushNotificationsManager._();

// //   final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
// //   bool showNotification = true;

// //   subscribe(String id) {
// //     sPrint.info('alarm:: $id');
// //     firebaseMessaging.subscribeToTopic(id);
// //   }

// //   unSubscribe(String id) {
// //     firebaseMessaging.unsubscribeFromTopic(id);
// //   }

// //   getNotification() {
// //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //       sPrint.info('getMessage::: $message');
// //       RemoteNotification? notification = message.notification;
// //       sPrint.info('notificationMessage::::${message.notification?.toMap()}');
// //       sPrint.info('notificationMessage::::${message.notification?.title}');
// //       sPrint.info('notificationMessage::::${message.notification?.body}');
// //       sPrint.info('notificationMessageData::::${message.data}');
// //       if (notification != null) {
// //     var notificationController = Get.put(NotificationController());
// //     notificationController.updateFirebaseNotification(message);
// //     showNotificationSnackBar(
// //       payload: "",
// //       title: message.notification?.title ?? "",
// //       message: message.notification?.body ?? "",
// //       onReceive: (ReceivedAction action) async {
// //         // Handle notification action here
// //         print('Notification received: ${action.payload}');
// //         return null;
// //       },
// //     );
// //   }
// //       if (message.data['type'] != null && message.data['type'] == 'alarm') {
// //         CustomAlarm.showAlarmNotification(
// //             title: message.data['title'],
// //             message: message.data['body'],
// //             id: message.data['id']);
// //         print("alarmmmmmmmmmmmmm ${message.data['title']}");
// //       } else if (notification != null) {
// //         var notificationController = Get.put(NotificationController());
// //         notificationController.updateFirebaseNotification(message);
// //         showNotificationSnackBar(
// //           payload: "",
// //           title: message.notification?.title ?? "",
// //           message: message.notification?.body ?? "",
// //           onReceive: (ReceivedAction p0) => Future.value(),
// //         );
// //         print("testyyyyyyyyyyyyyyyy ${message.notification?.title}");
// //       }
// //     });

// //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// //       sPrint.info('getMessage::: $message');
// //       RemoteNotification? notification = message.notification;
// //       sPrint.info('notificationMessage::::${message.notification?.title}');
// //       sPrint.info('notificationMessage::::${message.notification?.body}');
// //       sPrint.info('notificationMessageData::::${message.data}');
// //     });

// //     sPrint.info('start request permission');
// //     firebaseMessaging.requestPermission(
// //         sound: true, badge: true, alert: true, provisional: true);
// //   }

// //   Future<void> requestNotificationPermissions() async {
// //     final settings = await firebaseMessaging.getNotificationSettings();
// //     if (settings.authorizationStatus != AuthorizationStatus.authorized) {
// //       await firebaseMessaging.requestPermission();
// //     }

// //     // Request permissions for Awesome Notifications
// //     await AwesomeNotifications().requestPermissionToSendNotifications();
// //   }

// //   void _launchPowerUsageSettings() async {
// //     const url =
// //         'package:com.android.settings/com.android.settings.fuelgauge.PowerUsageSummary';
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }

// //   Future<String?> getNotificationToken() {
// //     return firebaseMessaging.getToken().then((String? token) {
// //       sPrint.info('token - fcm token :: $token');
// //       return token;
// //     });
// //   }

// //   static void showNotificationSnackBar({
// //   required String title,
// //   required String message,
// //   required String payload,
// //   required Future<dynamic> Function(ReceivedAction) onReceive,
// // }) async {
// //   bool isNotificationAllowed = await AwesomeNotifications().isNotificationAllowed();

// //   if (!isNotificationAllowed) {
// //     isNotificationAllowed = await AwesomeNotifications().requestPermissionToSendNotifications();
// //   }

// //   if (isNotificationAllowed) {
// //     await AwesomeNotifications().createNotification(
// //       content: NotificationContent(
// //         id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
// //         channelKey: 'basic_channel',
// //         title: title,
// //         body: message,
// //         payload: {'payload': payload},
// //       ),
// //     );
// //   } else {
// //     Get.snackbar(title, message, duration: const Duration(seconds: 3));
// //   }
// // }
// // }

// // class LocalNotification {

// // static  Future<void> requestAlarmPermissions() async {
// //   // Request standard notification permissions
// //   bool isAllowed = await AwesomeNotifications().requestPermissionToSendNotifications(
// //     channelKey: 'mintalarm_channel_id',
// //     permissions: [
// //       NotificationPermission.Alert,
// //       NotificationPermission.Sound,
// //       NotificationPermission.Badge,
// //       NotificationPermission.Vibration,
// //       NotificationPermission.CriticalAlert, // Especially important for alarms
// //     ]
// //   );

// //   // Request additional Android-specific alarm permissions
// //   if (Platform.isAndroid) {
// //     final status = await Permission.scheduleExactAlarm.request();
// //     if (!status.isGranted) {
// //       // Handle case when permission is denied
// //       print('Exact alarm permission not granted');
// //     }
// //   }

// //   // For iOS, critical alerts require special permission
// //   if (Platform.isIOS) {
// //     final status = await Permission.criticalAlerts.request();
// //     if (!status.isGranted) {
// //       // Handle case when permission is denied
// //       print('Critical alerts permission not granted');
// //     }
// //   }
// // }

// //   static Future initialize(
// //     Future<dynamic> Function(ReceivedAction) onActionReceived) async {
// //   await AwesomeNotifications().initialize(
// //     null, // icon for app
// //     [
// //       NotificationChannel(
// //         channelKey: 'basic_channel',
// //         channelName: 'Basic notifications',
// //         channelDescription: 'Notification channel for basic tests',
// //         defaultColor: const Color(0xFF9D50DD),
// //         ledColor: Colors.white,
// //         importance: NotificationImportance.High,
// //         playSound: true,
// //       )
// //     ],
// //     debug: true,
// //   );

// //   AwesomeNotifications().setListeners(
// //     onActionReceivedMethod: onActionReceived,
// //     onNotificationCreatedMethod: (ReceivedNotification receivedNotification) async {},
// //     onNotificationDisplayedMethod: (ReceivedNotification receivedNotification) async {},
// //     onDismissActionReceivedMethod: (ReceivedAction receivedAction) async {},
// //   );
// // }



// //   static Future showBigTextNotification({
// //     int id = 0,
// //     required String title,
// //     required String body,
// //     String? payload,
// //   }) async {
// //     await AwesomeNotifications().createNotification(
// //       content: NotificationContent(
// //         id: id == 0 ? DateTime.now().millisecondsSinceEpoch ~/ 1000 : id,
// //         channelKey: 'basic_channel',
// //         title: title,
// //         body: body,
// //         payload: {'payload': payload ?? ''},
// //         largeIcon: 'resource://mipmap/ic_launcher',
// //         notificationLayout: NotificationLayout.BigText,
// //       ),
// //     );
// //   }

// //   static requestAlarmNotification() async {
// //     await Permission.scheduleExactAlarm.request();
// //     await Permission.criticalAlerts.request();
// //   }
// // }

// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:get/get.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // import '../configuration/print_types.dart';

// // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //     FlutterLocalNotificationsPlugin();

// // class PushNotificationsManager {
// //   PushNotificationsManager._();

// //   factory PushNotificationsManager() => _instance;

// //   static final PushNotificationsManager _instance =
// //       PushNotificationsManager._();

// //   final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

// // /*  final notificationController = Get.isRegistered<FcmNotificationController>()
// //       ? Get.put(FcmNotificationController())
// //       : Get.find<FcmNotificationController>();*/

// //   bool showNotification = true;

// //   subscribe(String id) {
// //     sPrint.info('alarm:: $id');
// //     firebaseMessaging.subscribeToTopic(id);
// //   }

// //   unSubscribe(String id) {
// //     firebaseMessaging.unsubscribeFromTopic(id);
// //   }

// //   getNotification() {
// //     FirebaseMessaging.onMessage.listen(
// //       (RemoteMessage message) {
// //         sPrint.info('getMessage::: $message');
// //         RemoteNotification? notification = message.notification;
// //         sPrint.info('notificationMessage::::${message.notification?.toMap()}');
// //         sPrint.info('notificationMessage::::${message.notification?.title}');
// //         sPrint.info('notificationMessage::::${message.notification?.body}');
// //         sPrint.info('notificationMessageData::::${message.data}');
// //         if (message.data['type'] != null && message.data['type'] == 'alarm') {
// //           CustomAlarm.showAlarmNotification(
// //               title: message.data['title'],
// //               message: message.data['body'],
// //               id: message.data['id']);
// //           print("alarmmmmmmmmmmmmm ${message.data['title']}");
// //         } else if (notification != null) {
// //           var notificationController = Get.put(NotificationController());
// //           notificationController.updateFirebaseNotification(message);
// //           showNotificationSnackBar(
// //             payload: "",
// //             title: message.notification?.title ?? "",
// //             message: message.notification?.body ?? "",
// //             onReceive: (p0) {},
// //           );
// //           print("testyyyyyyyyyyyyyyyy ${message.notification?.title}");
// //         }
// //       },
// //     );

// //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// //       sPrint.info('getMessage::: $message');
// //       RemoteNotification? notification = message.notification;
// //       sPrint.info('notificationMessage::::${message.notification?.title}');
// //       sPrint.info('notificationMessage::::${message.notification?.body}');
// //       sPrint.info('notificationMessageData::::${message.data}');
// //     });
// //     sPrint.info('start request permission');
// //     firebaseMessaging.requestPermission(
// //         sound: true, badge: true, alert: true, provisional: true);
// //   }

// //   Future<void> requestNotificationPermissions() async {
// //     final settings = await firebaseMessaging.getNotificationSettings();
// //     if (settings.authorizationStatus != AuthorizationStatus.authorized) {
// //       await firebaseMessaging.requestPermission();
// //     }
// //   }

// //   void _launchPowerUsageSettings() async {
// //     const url =
// //         'package:com.android.settings/com.android.settings.fuelgauge.PowerUsageSummary';
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }

// //   Future<String?> getNotificationToken() {
// //     return firebaseMessaging.getToken().then((String? token) {
// //       sPrint.info('token - fcm token :: $token');
// //       return token;
// //     });
// //   }

// //   static void showNotificationSnackBar({
// //     required String title,
// //     required String message,
// //     required String payload,
// //     required void Function(NotificationResponse) onReceive,
// //   }) async {
// //     /*Get.snackbar(title, message,
// //         icon: icon, onTap: onTap, duration: const Duration(seconds: 3));*/

// //     bool? showNotification = await flutterLocalNotificationsPlugin
// //         .resolvePlatformSpecificImplementation<
// //             AndroidFlutterLocalNotificationsPlugin>()
// //         ?.requestNotificationsPermission();
// //     sPrint.info('show notification:: $showNotification');
// //     if (showNotification == true) {
// //       LocalNotification.showBigTextNotification(
// //           title: title,
// //           body: message,
// //           fln: flutterLocalNotificationsPlugin,
// //           payload: payload);
// //     } else {
// //       Get.snackbar(title, message, duration: const Duration(seconds: 3));
// //     }
// //   }
// // }

// // class LocalNotification {
// //   static Future initialize(
// //       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
// //       void Function(NotificationResponse) onReceive) async {
// //     var initializationsSettings = const InitializationSettings(
// //         android: AndroidInitializationSettings('mipmap/ic_launcher'),
// //         iOS: DarwinInitializationSettings());
// //     await flutterLocalNotificationsPlugin.initialize(initializationsSettings,
// //         onDidReceiveBackgroundNotificationResponse: onReceive,
// //         onDidReceiveNotificationResponse: onReceive);
// //   }

// //   static Future showBigTextNotification(
// //       {var id = 0,
// //       required String title,
// //       required String body,
// //       var payload,
// //       required FlutterLocalNotificationsPlugin fln}) async {
// //     AndroidNotificationDetails androidPlatformChannelSpecifics =
// //         AndroidNotificationDetails(
// //       title,
// //       'com.mint.android',
// //       playSound: true,
// //       //   sound: const RawResourceAndroidNotificationSound('notification'),
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       icon: '@mipmap/ic_launcher',
// //       largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
// //     );

// //     var not = NotificationDetails(
// //         android: androidPlatformChannelSpecifics,
// //         iOS: const DarwinNotificationDetails());
// //     await fln.show(id, title, body, not, payload: payload);
// //   }

// //   requestAlarmNotification() {
// //     Permission.scheduleExactAlarm.request();
// //     Permission.criticalAlerts.request();
// //   }
// // }






