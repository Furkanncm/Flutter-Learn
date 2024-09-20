import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    return _instance ?? LanguageManager._init();
  }

  LanguageManager._init();

  final _enLocale = const Locale("en", "US");

  List<Locale> get supportedLocales => [_enLocale];
}
