import 'package:shared_preferences/shared_preferences.dart';

const _showBiometric = "open";

class BiometricStorage {
  static late final SharedPreferences _biometric;

  static Future<void> init() async {
    _biometric = await SharedPreferences.getInstance();
  }

  static Future<void> storeBiometric(bool showBiometric) async {
    await _biometric.setBool(_showBiometric, showBiometric);
  }

  static bool retrieveBiometric() {
    return _biometric.getBool(_showBiometric) ?? false;
  }

  static clearBiometric() {
    _biometric.clear();
  }
}