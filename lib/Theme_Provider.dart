import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
    // timePickerTheme: TimePickerThemeData(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //   dialHandColor: Color.fromRGBO(1, 206, 209, 1),
    //   dayPeriodColor: Color.fromRGBO(1, 206, 209, 1),
    //   hourMinuteTextColor: Color.fromRGBO(1, 206, 209, 1),
    //   dialTextColor: Color.fromRGBO(1, 206, 209, 1),
    //   inputDecorationTheme: InputDecorationTheme(
    //       focusColor: Color.fromRGBO(1, 206, 209, 1),
    //       hoverColor: Color.fromRGBO(1, 206, 209, 1),
    //       enabledBorder: OutlineInputBorder(
    //           borderSide: BorderSide(
    //             width: 1,
    //             color: Color.fromRGBO(1, 206, 209, 1),
    //           ),
    //           borderRadius: BorderRadius.circular(10))),
    //   dayPeriodTextColor: Color.fromRGBO(1, 206, 209, 1),
    //   dialBackgroundColor: Color.fromRGBO(1, 206, 209, 0.3),
    // ),
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Color.fromRGBO(1, 206, 209, 1),
    backgroundColor: Color.fromRGBO(245, 245, 245, 1),
    cursorColor: Color.fromRGBO(1, 1, 1, 0.5),
    hintColor: Color.fromRGBO(1, 1, 1, 0.6),
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Color.fromRGBO(1, 1, 1, 0.8),
    shadowColor: Color.fromRGBO(227, 227, 227, 1.0),
    colorScheme: ColorScheme.light(),
    fontFamily: "Vazir");

ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromRGBO(23, 23, 23, 1.0),
    accentColor: Color.fromRGBO(1, 206, 209, 1),
    backgroundColor: Color.fromRGBO(34, 34, 34, 1),
    cursorColor: Color.fromRGBO(1, 1, 1, 0.5),
    hintColor: Color.fromRGBO(245, 245, 245, 1),
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Color.fromRGBO(1, 1, 1, 0.8),
    shadowColor: Color.fromRGBO(5, 5, 5, 1.0),
    colorScheme: ColorScheme.dark(),
    fontFamily: "Vazir");

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _pref;
  bool? _darkTheme;

  bool? get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme!;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _pref!.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref!.setBool(key, _darkTheme!);
  }
}
