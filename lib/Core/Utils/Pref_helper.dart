import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // --- Auth Section ---
  static const String _tokenKey = 'auth_token';
  static Future<void> saveToken(String token) async =>
      await _prefs.setString(_tokenKey, token);
  static Future<String?> getToken() async => _prefs.getString(_tokenKey);
  static Future<void> clearToken() async => await _prefs.remove(_tokenKey);

  // --- UI settings Section ---
  static const String _langKey = 'app_lang';
  static Future<void> cacheLanguage(String lang) async =>
      await _prefs.setString(_langKey, lang);
  static String getLanguage() => _prefs.getString(_langKey) ?? 'ar';

  static const String _themeKey = 'is_dark';
  static Future<void> cacheTheme(bool isDark) async =>
      await _prefs.setBool(_themeKey, isDark);
  static bool isDarkMode() => _prefs.getBool(_themeKey) ?? false;
}
