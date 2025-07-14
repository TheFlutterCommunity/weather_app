import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_router/go_router.dart';

import '../../main.dart';

final class AppNavigator {
  /// Check platform, for app, invoke push and for web, invoke go
  static void push(String path) {
    if (kIsWeb) {
      navigatorKey.currentContext!.go(path);
    } else {
      navigatorKey.currentContext!.push(path);
    }
  }

  static void replace(String path) {
    navigatorKey.currentContext!.replace(path);
  }

  static void pop() {
    navigatorKey.currentContext!.pop();
  }

  //TODO: Not implemented
  static List<String> getRoutes() {
    return [];
  }
}
