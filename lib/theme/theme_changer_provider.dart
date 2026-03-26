import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  var _themeMode = ThemeMode.system;

  ThemeMode get getThemeMode => _themeMode;

  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
