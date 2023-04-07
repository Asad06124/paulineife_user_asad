import 'package:custom_utils/custom_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/controller/login_controller.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:paulineife_user/views/screens/screen_onboarding.dart';
import 'package:paulineife_user/widgets/custom_error.dart';

import 'helpers/theme.dart';

void main() async {
  var bindings = await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FlutterNativeSplash.preserve(widgetsBinding: bindings);
  startApp();
}

void startApp() async {
  var loginResponse = await LoginController.getLoginResponse();
  runApp(MyApp(
    loggedIn: loginResponse != null,
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  bool loggedIn;

  @override
  State<MyApp> createState() => _MyAppState();

  MyApp({
    required this.loggedIn,
  });
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          home: widget.loggedIn ? HomeScreen() : ScreenOnboarding(),
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
            return ScrollConfiguration(
                behavior: NoColorScrollBehavior(), child: widget!);
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

class NoColorScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
