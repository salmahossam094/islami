import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String Language = 'en';

  changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  chageLanguage(String lang) {
    Language = lang;
    notifyListeners();
  }
}
