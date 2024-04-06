import 'package:crypto_currency_tracker/src/models/local_storage.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  ThemeProvider(String theme) {
    if (theme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      LocalStorage.saveTheme("dark");
    } else {
      themeMode = ThemeMode.light;
      LocalStorage.saveTheme("light");
    }
    notifyListeners();
  }
}
