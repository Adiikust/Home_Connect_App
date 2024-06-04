import 'package:shared_preferences/shared_preferences.dart';
class StorageManager {
  static void saveData(String key,value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  static Future<dynamic> readData(key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.getBool(key);
    return obj;
  }

  static Future<bool> deleteData(key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
