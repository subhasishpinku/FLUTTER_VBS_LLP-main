// import 'dart:async';
// import 'dart:io';
// // ignore: unnecessary_import

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_demos/NotificationPart1/HomePage.dart';
// import 'package:flutter_demos/NotificationPart1/SecondPage.dart';
// import 'package:flutter_demos/NotificationPart1/model/ReceivedNotification.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// int id = 0;

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// /// Streams are created so that app can respond to notification-related events
// /// since the plugin is initialised in the `main` function
// final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
//     StreamController<ReceivedNotification>.broadcast();

// final StreamController<String?> selectNotificationStream =
//     StreamController<String?>.broadcast();

// const MethodChannel platform =
//     MethodChannel('dexterx.dev/flutter_local_notifications_example');

// const String portName = 'notification_send_port';

// String? selectedNotificationPayload;

// /// A notification action which triggers a url launch event
// const String urlLaunchActionId = 'id_1';

// /// A notification action which triggers a App navigation event
// const String navigationActionId = 'id_3';

// /// Defines a iOS/MacOS notification category for text input actions.
// const String darwinNotificationCategoryText = 'textCategory';

// /// Defines a iOS/MacOS notification category for plain actions.
// const String darwinNotificationCategoryPlain = 'plainCategory';

// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   // ignore: avoid_print
//   print('notification(${notificationResponse.id}) action tapped: '
//       '${notificationResponse.actionId} with'
//       ' payload: ${notificationResponse.payload}');
//   if (notificationResponse.input?.isNotEmpty ?? false) {
//     // ignore: avoid_print
//     print(
//         'notification action tapped with input: ${notificationResponse.input}');
//   }
// }

// /// IMPORTANT: running the following code on its own won't work as there is
// /// setup required for each platform head project.
// ///
// /// Please download the complete example app from the GitHub repository where
// /// all the setup has been done
// Future<void> main() async {
//   // needed if you intend to initialize in the `main` function
//   WidgetsFlutterBinding.ensureInitialized();

//   await _configureLocalTimeZone();

//   final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
//           Platform.isLinux
//       ? null
//       : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//   String initialRoute = HomePage.routeName;
//   if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
//     selectedNotificationPayload =
//         notificationAppLaunchDetails!.notificationResponse?.payload;
//     initialRoute = SecondPage.routeName;
//   }

//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('app_icon');

//   final List<DarwinNotificationCategory> darwinNotificationCategories =
//       <DarwinNotificationCategory>[
//     DarwinNotificationCategory(
//       darwinNotificationCategoryText,
//       actions: <DarwinNotificationAction>[
//         DarwinNotificationAction.text(
//           'text_1',
//           'Action 1',
//           buttonTitle: 'Send',
//           placeholder: 'Placeholder',
//         ),
//       ],
//     ),
//     DarwinNotificationCategory(
//       darwinNotificationCategoryPlain,
//       actions: <DarwinNotificationAction>[
//         DarwinNotificationAction.plain('id_1', 'Action 1'),
//         DarwinNotificationAction.plain(
//           'id_2',
//           'Action 2 (destructive)',
//           options: <DarwinNotificationActionOption>{
//             DarwinNotificationActionOption.destructive,
//           },
//         ),
//         DarwinNotificationAction.plain(
//           navigationActionId,
//           'Action 3 (foreground)',
//           options: <DarwinNotificationActionOption>{
//             DarwinNotificationActionOption.foreground,
//           },
//         ),
//         DarwinNotificationAction.plain(
//           'id_4',
//           'Action 4 (auth required)',
//           options: <DarwinNotificationActionOption>{
//             DarwinNotificationActionOption.authenticationRequired,
//           },
//         ),
//       ],
//       options: <DarwinNotificationCategoryOption>{
//         DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
//       },
//     )
//   ];

//   /// Note: permissions aren't requested here just to demonstrate that can be
//   /// done later
//   final DarwinInitializationSettings initializationSettingsDarwin =
//       DarwinInitializationSettings(
//     requestAlertPermission: false,
//     requestBadgePermission: false,
//     requestSoundPermission: false,
//     onDidReceiveLocalNotification:
//         (int id, String? title, String? body, String? payload) async {
//       didReceiveLocalNotificationStream.add(
//         ReceivedNotification(
//           id: id,
//           title: title,
//           body: body,
//           payload: payload,
//         ),
//       );
//     },
//     notificationCategories: darwinNotificationCategories,
//   );
//   final LinuxInitializationSettings initializationSettingsLinux =
//       LinuxInitializationSettings(
//     defaultActionName: 'Open notification',
//     defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
//   );
//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsDarwin,
//     macOS: initializationSettingsDarwin,
//     linux: initializationSettingsLinux,
//   );
//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//     onDidReceiveNotificationResponse:
//         (NotificationResponse notificationResponse) {
//       switch (notificationResponse.notificationResponseType) {
//         case NotificationResponseType.selectedNotification:
//           selectNotificationStream.add(notificationResponse.payload);
//           break;
//         case NotificationResponseType.selectedNotificationAction:
//           if (notificationResponse.actionId == navigationActionId) {
//             selectNotificationStream.add(notificationResponse.payload);
//           }
//           break;
//       }
//     },
//     onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//   );
//   runApp(
//     MaterialApp(
//       initialRoute: initialRoute,
//       routes: <String, WidgetBuilder>{
//         HomePage.routeName: (_) => HomePage(notificationAppLaunchDetails),
//         SecondPage.routeName: (_) => SecondPage(selectedNotificationPayload)
//       },
//     ),
//   );
// }

// Future<void> _configureLocalTimeZone() async {
//   if (kIsWeb || Platform.isLinux) {
//     return;
//   }
//   tz.initializeTimeZones();
//   final String? timeZoneName = await FlutterTimezone.getLocalTimezone();
//   tz.setLocalLocation(tz.getLocation(timeZoneName!));
// }

// class PaddedElevatedButton extends StatelessWidget {
//   const PaddedElevatedButton({
//     required this.buttonText,
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);

//   final String buttonText;
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) => Padding(
//         padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
//         child: ElevatedButton(
//           onPressed: onPressed,
//           child: Text(buttonText),
//         ),
//       );
// }

// Future<LinuxServerCapabilities> getLinuxCapabilities() =>
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             LinuxFlutterLocalNotificationsPlugin>()!
//         .getCapabilities();
