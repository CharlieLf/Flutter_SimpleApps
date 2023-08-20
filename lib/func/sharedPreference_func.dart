import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const selectedTheme = "STATUS";
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(selectedTheme, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(selectedTheme) ?? false;
  }
}
