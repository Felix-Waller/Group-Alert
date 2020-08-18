import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Colors.white,
      primaryColorBrightness: Brightness.light,
      accentColor: Colors.blueAccent,
      accentColorBrightness: Brightness.light,
      backgroundColor: Colors.grey[300],
      canvasColor: Colors.grey[100],
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark();
  }
}
