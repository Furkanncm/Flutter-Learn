import 'package:flutter/src/material/theme_data.dart';
import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ?? AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get themeData => ThemeData.dark();
}
