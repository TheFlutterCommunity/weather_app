import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../index.dart';

class Utils {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: base.toInt(),
      backgroundColor: errorColor,
      textColor: whiteColor,
      fontSize: s4,
    );
  }

  static Future<bool> hasConnectivity() async {
    /// Check connectivity
    final results = await Connectivity().checkConnectivity();
    if (results.contains(ConnectivityResult.none)) return false;
    return true;
  }
}
