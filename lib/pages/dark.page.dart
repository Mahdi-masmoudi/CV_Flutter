import 'package:flutter/material.dart';
class DarkModeHelper {
  bool isDarkMode = true;

  ThemeData getThemeData() {
    return isDarkMode ? _lightTheme : _darkTheme;
  }

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
  }

   IconData _iconLight = Icons.wb_sunny;
   IconData _iconDark = Icons.nights_stay;

   ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.teal,
    brightness: Brightness.light,
    cardColor: Colors.teal, // Add this line for card color in light mode
  );

   ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.teal,
    brightness: Brightness.dark,
    cardColor: Colors.black, // Add this line for card color in dark mode
  );

  IconData getIcon() {
    return isDarkMode ? _iconDark : _iconLight;
  }

}
