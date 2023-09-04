import 'package:shared_preferences/shared_preferences.dart';

const _accessToken = 'access_token';

class AccessTokenStorage {
  static late final SharedPreferences _tokenAccess;

  static Future<void> init() async {
    _tokenAccess = await SharedPreferences.getInstance();
  }

  static Future<void> storeToken(String token) async {
    await _tokenAccess.setString(_accessToken, token);
  }

  static String retrieveToken() {
    return _tokenAccess.getString(_accessToken) ?? '';
  }

  static clearToken() {
    _tokenAccess.clear();
  }
}