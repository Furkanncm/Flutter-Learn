import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { action , number, input}

class SharedManager {
  SharedPreferences? sharedPreferences;

  SharedManager() {
    init();
  }

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(SharedKeys key, String value) async {
    await sharedPreferences?.setString(key.name, value);
  }

  Future<void> setInt(SharedKeys key, int value) async {
    await sharedPreferences?.setInt(key.name, value);
  }

  String? getString(SharedKeys key) {
    return sharedPreferences?.getString(key.name) ?? "";
  }

  int? getInt(SharedKeys key) {
    return sharedPreferences?.getInt(key.name)?? 0;
  }

  Future<bool> removeItem(SharedKeys key) async {
    return await sharedPreferences?.remove(key.name) ?? false;
  }
}
