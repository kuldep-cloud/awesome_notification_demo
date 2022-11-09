import 'package:flutter/cupertino.dart';

import 'state/app_state.dart';

///  *********************************************
///     MAIN WIDGET
///  *********************************************
///
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // The navigator key is necessary to navigate using static methods
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static Color mainColor = const Color(0xFFFF0000);

  @override
  State<MyApp> createState() => AppState();
}