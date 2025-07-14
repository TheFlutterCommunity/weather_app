import 'package:flutter/material.dart';

import 'index.dart';

/// Navigation State
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Register DI
  setupLocator();

  /// Initialize Prefs
  await PrefsHelper.init();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: appTheme,
      routerConfig: router,
    );
  }
}
