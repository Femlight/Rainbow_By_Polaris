import 'package:shared_preferences/shared_preferences.dart';

const _userPassword = 'userPassword';

class UserPasswordStorage {
  static late final SharedPreferences _password;

  static Future<void> init() async {
    _password = await SharedPreferences.getInstance();
  }

  static Future<void> storeUserPassword(String password) async {
    await _password.setString(_userPassword, password);
  }

  static String retrieveUserPassword() {
    return _password.getString(_userPassword) ?? '';
  }

  static clearUserPin() {
    _password.clear();
  }
}