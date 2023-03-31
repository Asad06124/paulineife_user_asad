import 'package:custom_utils/custom_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_onboarding.dart';
import 'package:paulineife_user/widgets/custom_error.dart';

import 'helpers/theme.dart';
/*Created Project "paulineife_user" by MicroProgramers - https://microprogramers.org*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

// void colorConfig() {
//   appPrimaryColor = MaterialColor(
//     4281309137,
//     const <int, Color>{
//       50: const Color(4281309137),
//       100: const Color(4281309137),
//       200: const Color(4281309137),
//       300: const Color(4281309137),
//       400: const Color(4281309137),
//       500: const Color(4281309137),
//       600: const Color(4281309137),
//       700: const Color(4281309137),
//       800: const Color(4281309137),
//       900: const Color(4281309137),
//     },
//   );
//   appBoxShadow = [BoxShadow(blurRadius: 18, color: Color(0x414D5678))];
//   buttonColor = const Color(0xFFED1C24);
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   setupInteractedMessage();
  //   initNotificationChannel();
  //   setupNotificationChannel();
  //   super.initState();
  // }

  // Future<void> setupInteractedMessage() async {
  //   // Get any messages which caused the application to open from
  //   // a terminated state.
  //   RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  //
  //   // If the message also contains a data property with a "type" of "chat",
  //   // navigate to a chat screen
  //   if (initialMessage != null) {
  //     _handleMessage(initialMessage);
  //   }
  //
  //   // Also handle any interaction when the app is in the background via a
  //   // Stream listener
  //   FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  // }
  //
  // void _handleMessage(RemoteMessage message) {
  //   if (message.data['type'] == 'chat') {}
  // }

  // void setupNotificationChannel() async {
  //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //
  //   final settingsAndroid = AndroidInitializationSettings('app_icon');
  //   final settingsIOS = IOSInitializationSettings(
  //       onDidReceiveLocalNotification: (id, title, body, payload) =>
  //       null/*onSelectNotification(payload)*/);
  //   await flutterLocalNotificationsPlugin.initialize(InitializationSettings(
  //       android: settingsAndroid,
  //       iOS: settingsIOS
  //   ));
  //
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);
  //
  //
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     AppleNotification? iOS = message.notification?.apple;
  //
  //     // If `onMessage` is triggered with a notification, construct our own
  //     // local notification to show to users using the created channel.
  //     if (notification != null && android != null) {
  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
  //               channelDescription: channel.description,
  //               icon: android.smallIcon,
  //               enableVibration: true,
  //               // importance: Importance.max,
  //               // priority: Priority.high,
  //               // ongoing: true,
  //               // autoCancel: false,
  //               // other properties...
  //             ),
  //           ));
  //
  //       // showOngoingNotification(flutterLocalNotificationsPlugin, title: notification.title ?? "", body: notification.body ?? "");
  //     }
  //   });
  // }

  // void setupNotificationChannel() async {
  //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //
  //   final settingsAndroid = AndroidInitializationSettings('app_icon');
  //   final settingsIOS = DarwinInitializationSettings(
  //       onDidReceiveLocalNotification: (id, title, body, payload) =>
  //       null/*onSelectNotification(payload)*/);
  //   await flutterLocalNotificationsPlugin.initialize(InitializationSettings(
  //       android: settingsAndroid,
  //       iOS: settingsIOS
  //   ));
  //
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);
  //
  //
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     AppleNotification? iOS = message.notification?.apple;
  //
  //     // If `onMessage` is triggered with a notification, construct our own
  //     // local notification to show to users using the created channel.
  //     if (notification != null && android != null) {
  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
  //               channelDescription: channel.description,
  //               icon: android.smallIcon,
  //               enableVibration: true,
  //               importance: Importance.max,
  //               priority: Priority.high,
  //               ongoing: true,
  //               autoCancel: false,
  //               // other properties...
  //             ),
  //           ));
  //
  //       showOngoingNotification(flutterLocalNotificationsPlugin, title: notification.title ?? "", body: notification.body ?? "");
  //     }
  //   });
  //
  // }
//   void initNotificationChannel() async {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
//     final DarwinInitializationSettings initializationSettingsIOS =
//     DarwinInitializationSettings();
//     final DarwinInitializationSettings initializationSettingsMacOS =
//     DarwinInitializationSettings();
//     final InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsIOS,
//         macOS: initializationSettingsMacOS);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//   }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return GetMaterialApp(
          home: ScreenOnboarding(),
          locale: Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          title: "Paulineife",
          routingCallback: (route) {
            print(route?.current);
          },
          themeMode: ThemeMode.light,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          builder: (context, widget) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return CustomError(errorDetails: errorDetails);
            };
            return ScrollConfiguration(behavior: NoColorScrollBehavior(), child: widget!);
            // return widget!;
            // return ScrollConfiguration(behavior: ScrollBehaviorModified(), child: widget!);
          },
        );
      },
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//
//   print("Handling a background message: ${message}");
// }

class NoColorScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
