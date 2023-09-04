import 'package:shared_preferences/shared_preferences.dart';

var _username = 'user';

class UserNameStorage {
  static late final SharedPreferences _user;

  static Future<void> init() async {
    _user = await SharedPreferences.getInstance();
  }

  static Future<void> storeUsername(String user) async {
    await _user.setString(_username, user);
  }

  static clearUsername() {
    _user.clear();
  }

  static String retrieveUsername() {
    return _user.getString(_username) ?? '';
  }
}