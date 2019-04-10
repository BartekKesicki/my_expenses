import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static final String idCode = "idCode";

  Future<int> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(idCode) ?? 0;
  }

  Future<bool> setLanguageCode(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(idCode, value);
  }
}