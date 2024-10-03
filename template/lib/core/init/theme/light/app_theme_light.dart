import 'package:flutter/material.dart';

import '../app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ?? AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get themeData => ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        cardColor: Colors.brown,
        cardTheme: const CardTheme(color: Colors.green),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.red,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.brown),
        scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: TextTheme()
      );
}
