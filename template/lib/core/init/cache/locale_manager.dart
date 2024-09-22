import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/constants/enum/preferences_enum.dart';

class LocaleManager {
  static final LocaleManager _instance= LocaleManager._init();
  late SharedPreferences _sharedPreferences;
  static LocaleManager get instance =>_instance;

  LocaleManager._init();

  static preferencesInit() async {
    instance._sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(PreferencesEnum key, String value) async {
    await _sharedPreferences.setString(key.toString(), value);
  }

  String? getStringValue(PreferencesEnum key) =>
      _sharedPreferences.getString(key.toString());
}
