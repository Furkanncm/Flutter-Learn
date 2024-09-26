import 'dart:ui';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    return _instance ??= LanguageManager._init();
  }

  LanguageManager._init();

  Locale enLocale = const Locale("en", "US");
  
  List<Locale> get supportedLocales => [enLocale];
}
