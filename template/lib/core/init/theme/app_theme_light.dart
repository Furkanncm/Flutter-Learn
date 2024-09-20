import 'package:flutter/material.dart';
import 'package:template/core/init/theme/app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ?? AppThemeLight._init();
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData.light();
}
