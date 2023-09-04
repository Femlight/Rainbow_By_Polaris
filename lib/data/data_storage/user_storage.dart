import 'package:shared_preferences/shared_preferences.dart';

const _lastName = 'lastName';
const _firstName = 'firstName';
const _childFirstName = 'childFirstName';
const _phoneNumber = 'phoneNumber';
const _email = 'email';
const _parentId = 'parentId';
const _childId = 'childId';

class UserStorage {
  static late final SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> storeLastName(String lastName) async {
    await _pref.setString(_lastName, lastName);
  }

  static Future<void> storeFirstName(String firstName) async {
    await _pref.setString(_firstName, firstName);
  }

  static Future<void> storeChildFirstName(String childFirstName) async {
    await _pref.setString(_childFirstName, childFirstName);
  }

  static Future<void> storePhoneNumber(String phoneNumber) async {
    await _pref.setString(_phoneNumber, phoneNumber);
  }

  static Future<void> storeEmail(String email) async {
    await _pref.setString(_email, email);
  }

  static Future<void> storeParentId(String parentId) async {
    await _pref.setString(_parentId, parentId);
  }

  static Future<void> storeChildId(String childId) async {
    await _pref.setString(_childId, childId);
  }

  static String retrieveFirstName() {
    return _pref.getString(_firstName) ?? '';
  }

  static String retrieveChildFirstName() {
    return _pref.getString(_childFirstName) ?? '';
  }

  static String retrieveLastName() {
    return _pref.getString(_lastName) ?? '';
  }

  static String retrievePhoneNumber() {
    return _pref.getString(_phoneNumber) ?? '';
  }

  static String retrieveEmail() {
    return _pref.getString(_email) ?? '';
  }

  static String retrieveParentId() {
    return _pref.getString(_parentId) ?? '';
  }

  static String retrieveChildId() {
    return _pref.getString(_childId) ?? '';
  }

  static clearName() {
    _pref.clear();
  }
}
