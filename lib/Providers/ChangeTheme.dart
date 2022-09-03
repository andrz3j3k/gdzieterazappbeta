import 'package:flutter/material.dart';

class ChangeTheme extends ChangeNotifier {
  ThemeMode? themeMode;

  toggleTheme(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
