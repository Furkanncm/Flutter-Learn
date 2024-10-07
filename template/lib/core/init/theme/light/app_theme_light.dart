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
        primaryColor: const Color(0xffeba246),
        cardColor: const Color(0xffeba246),
        buttonTheme: const ButtonThemeData(buttonColor: Color(0xffeba246)),
        iconTheme: const IconThemeData(color: Colors.black),
        cardTheme: const CardTheme(color: Colors.white),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xffeba246),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
          displaySmall: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
          displayMedium: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          labelSmall: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          labelMedium: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        tabBarTheme: const TabBarTheme(indicatorColor: Color(0xffeba246), indicatorSize: TabBarIndicatorSize.label, labelColor: Colors.black, unselectedLabelColor: (Colors.grey), labelStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300)),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color(0xffeba246)))),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: const Color.fromARGB(255, 226, 226, 226),
      );
}
