import 'package:shared_preferences/shared_preferences.dart';

class ApplocalStorage {
  static String token = "token";
  static late SharedPreferences _sharedPreferences;
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Cachdata({required String key, required dynamic value}) async {
    if (value is int) {
      await _sharedPreferences.setInt(key, value);
    }
    if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    }
    if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    }
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }
}
