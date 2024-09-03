import 'package:shared_preferences/shared_preferences.dart';

class Manager {
  SharedPreferences? sharedPreferences;

  Manager() {
    init();
  }
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getStringItem(SKeys sKeys) {
    sharedPreferences?.getString(sKeys.name);
    return null;
  }

  Future<void> setStringItem(SKeys sKeys, String value) async {
    await sharedPreferences?.setString(sKeys.name, value);
  }

  Future<bool> removeItem(SKeys sKeys) async {
    return await sharedPreferences?.remove(sKeys.name) ?? false;
  }
}

enum SKeys { action, input, number }
