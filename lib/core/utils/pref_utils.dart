//ignore: unused_import
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  static Future<void> saveAccessToken(String accessToken) async {
    _sharedPreferences?.setString(accessTokenKey, accessToken);
  }

  static Future<String?> getAccessToken() async {
    return _sharedPreferences?.getString(accessTokenKey);
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    _sharedPreferences?.setString(refreshTokenKey, refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    return _sharedPreferences?.getString(refreshTokenKey);
  }
}
