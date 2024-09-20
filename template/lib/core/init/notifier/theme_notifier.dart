import 'package:flutter/material.dart';
import 'package:template/core/init/theme/app_theme_light.dart';
import '../theme/app_theme_dark.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeTheme() {
    _currentTheme = _currentTheme == AppThemeLight.instance.theme
        ? AppThemeDark.instance.theme
        : AppThemeLight.instance.theme;
    notifyListeners();
  }
}