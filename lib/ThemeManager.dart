import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  var brightness = SchedulerBinding.instance!.window.platformBrightness;

  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    if (isOn) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}

final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.dark(),
    fontFamily: "Vazir");

final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Color.fromRGBO(1, 206, 209, 1),
    backgroundColor: Color.fromRGBO(245, 245, 245, 1),
    cursorColor: Color.fromRGBO(1, 1, 1, 0.5),
    hintColor: Color.fromRGBO(1, 1, 1, 0.6),
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    colorScheme: ColorScheme.light(),
    fontFamily: "Vazir");

// class ThemeProvider extends ChangeNotifier {
//   ThemeData? _selectedTheme;

//   ThemeData light = ThemeData(
//       brightness: Brightness.light,
//       primaryColor: Colors.white,
//       accentColor: Color.fromRGBO(1, 206, 209, 1),
//       backgroundColor: Color.fromRGBO(245, 245, 245, 1),
//       cursorColor: Color.fromRGBO(1, 1, 1, 0.5),
//       hintColor: Color.fromRGBO(1, 1, 1, 0.6),
//       accentIconTheme: IconThemeData(color: Colors.white),
//       dividerColor: Colors.white54,
//       colorScheme: ColorScheme.light(),
//       fontFamily: "Vazir");

//   ThemeData dark = ThemeData(
//       primarySwatch: Colors.grey,
//       primaryColor: Colors.black,
//       brightness: Brightness.dark,
//       backgroundColor: const Color(0xFF212121),
//       accentColor: Colors.white,
//       accentIconTheme: IconThemeData(color: Colors.black),
//       dividerColor: Colors.black12,
//       colorScheme: ColorScheme.dark(),
//       fontFamily: "Vazir");

//   ThemeProvider({required int isDarkMode}) {
//     if (isDarkMode == 1) {
//       _selectedTheme = dark;
//     } else {
//       _selectedTheme = light;
//     }
//   }
//   Future<void> swapTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (_selectedTheme == light) {
//       _selectedTheme = light;
//       prefs.setInt("isDarkTheme", 0);
//     } else {
//       _selectedTheme = dark;
//       prefs.setInt("isDarkTheme", 1);
//     }
//   }

//   ThemeData? get getTheme => _selectedTheme;
// }
