import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String language = 'en';

  changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }
}
