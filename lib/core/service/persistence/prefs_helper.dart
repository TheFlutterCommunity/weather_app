import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../index.dart';

/// Class: PrefsHelper
/// Version: 1.0
/// Date: 13/07/2025
/// Developer: Deepak Nishad
/// Description: Shared Preferences Helper

//TODO: Optimization required
class PrefsHelper {
  static SharedPreferences? prefs;

  /// Initialize Prefs
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// Create / Update Operation
  void setInt(String key, int value) async {
    prefs!.setInt(key, value);
  }

  void setString(String key, String? value) async {
    await prefs!.setString(key, value!);
  }

  void setBool(String key, bool value) async {
    prefs!.setBool(key, value);
  }

  void setDouble(String key, double value) async {
    prefs!.setDouble(key, value);
  }

  Future<bool> remove(String key) async {
    return prefs!.remove(key);
  }

  ///Read Operation
  Future<int> getInt(String key, int value) async {
    return prefs!.getInt(key) ?? value;
  }

  Future<String> getString(String key, String value) async {
    return prefs!.getString(key) ?? value;
  }

  Future<bool> getBool(String key, bool value) async {
    return prefs!.getBool(key) ?? value;
  }

  Future<double> getDouble(String key, double value) async {
    return prefs!.getDouble(key) ?? value;
  }

  /// Create User Session
  Future<void> createUserSession({required UserDetails user}) async {
    _setSignedInState(true);

    setInt(keyUserId, user.userId);
    setString(keyUserName, user.userName);
    setString(keyUserEmailId, user.emailId);
    setString(keyToken, user.token);
    setString(keyMobileNo, user.mobileNo);

    debugPrint(
      "createUserSession::"
      "\nUSER_ID:: ${user.userId}"
      "\nUSER_NAME:: ${user.userName}"
      "\nEMAIL_ID:: ${user.emailId}"
      "\nTOKEN:: ${user.token}"
      "\nMOBILE_NO::${user.mobileNo}",
    );
  }

  /// Set SignIn State
  void _setSignedInState(bool isLoggedIn) async {
    setBool(keyIsSignedIn, isLoggedIn);
  }

  /// Get User ID
  Future<int> getUserId() async {
    return getInt(keyUserId, k1Minus);
  }

  /// Get User Name
  Future<String> getUserName() async {
    return getString(keyUserName, kEmptyString);
  }

  /// Get SignIn Status
  Future<bool> isSignedIn() async {
    return getBool(keyIsSignedIn, false);
  }

  /// Clear the prefs
  void clear() async {
    prefs!.clear();
  }
}
