import 'package:flutter/material.dart';

import '../theme/dark/app_theme_dark.dart';
import '../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.themeData;
  ThemeData get currentTheme => _currentTheme;

  void changeTheme() {
    _currentTheme = _currentTheme == AppThemeLight.instance.themeData
        ? AppThemeDark.instance.themeData
        : AppThemeLight.instance.themeData;
    notifyListeners();
  }
}
