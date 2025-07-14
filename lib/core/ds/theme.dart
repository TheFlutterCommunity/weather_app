import 'package:flutter/material.dart';

import '../index.dart';

/// DO NOT CHANGE
/// Component: Design System
/// Token Name: Theme
/// Author: Deepak Nishad
/// Version: 1.0
ThemeData get appTheme => ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
  scaffoldBackgroundColor: backgroundColor,
  //TODO: Commented App Font
  ///fontFamily: kAppFontEuclidCircularA,

  /// TextFormField InputDecorationTheme
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(addSizing(s2, half)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: greyColor),
      borderRadius: BorderRadius.circular(addSizing(s2, half)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: greyColor, width: half),
      borderRadius: BorderRadius.circular(addSizing(s2, half)),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: s4, vertical: s4),
    hintStyle: TextStyle(color: Colors.grey),
  ),
);
