import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniprojet/pages/dark.page.dart';
import 'package:miniprojet/pages/home.page.dart';
import 'package:miniprojet/pages/local.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DarkModeHelper darkModeHelper = DarkModeHelper();
  void _toggleDarkMode() {
    setState(() {
      darkModeHelper.toggleDarkMode();
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: Locale('en','US'),

      debugShowCheckedModeBanner: false,
      theme: darkModeHelper.isDarkMode
          ? _buildDarkTheme()
          : _buildLightTheme(),
      home: Scaffold(

        body: PageHome(),
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      primarySwatch: Colors.teal,
      appBarTheme: AppBarTheme(
        color: Colors.teal,
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData.dark().copyWith(
      hintColor: Colors.teal,
      appBarTheme: AppBarTheme(
        color: Colors.black,
      ),
    );
  }
}
