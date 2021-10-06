import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
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
    _darkTheme = true;
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
    _darkTheme = _pref!.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref!.setBool(key, _darkTheme!);
  }
}
