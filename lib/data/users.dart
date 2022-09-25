import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  final _keyUsername = 'username';
  final _keyUsersurname = 'usersurname';
  final _keyEmail = 'email';
  final _keyPassword = 'password';
  final _keyPhoneNumber = 'phoneNumber';
  final _newLaunch = 'launch';

  Future init() async => _preferences = await SharedPreferences.getInstance();

  Future setUsername(String username) async =>
      await _preferences?.setString(_keyUsername, username);
  Future setUsersurname(String usersurname) async =>
      await _preferences?.setString(_keyUsersurname, usersurname);
  Future setEmail(String email) async =>
      await _preferences?.setString(_keyEmail, email);
  Future setPassword(String password) async =>
      await _preferences?.setString(_keyPassword, password);
  Future setPhoneNumber(String phoneNumber) async =>
      await _preferences?.setString(_keyPhoneNumber, phoneNumber);
  Future setLaunch(bool launch) async =>
      await _preferences?.setBool(_newLaunch, launch);

  String? getUsername() => _preferences?.getString(_keyUsername);
  String? getUsersurname() => _preferences?.getString(_keyUsersurname);
  String? getEmail() => _preferences?.getString(_keyEmail);
  String? getPassword() => _preferences?.getString(_keyPassword);
  String? getPhoneNumber() => _preferences?.getString(_keyPhoneNumber);
  bool? getLaunch() => _preferences?.getBool(_newLaunch);

  Future<bool>? deleteUsername() => _preferences?.remove(_keyUsername);
  Future<bool>? deleteUsersurname() => _preferences?.remove(_keyUsersurname);
  Future<bool>? deleteEmail() => _preferences?.remove(_keyEmail);
  Future<bool>? deletePassword() => _preferences?.remove(_keyPassword);
}
