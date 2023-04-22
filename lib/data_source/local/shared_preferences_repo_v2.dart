import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

T? cast<T>(x) => x is T ? x : null;

abstract class BaseSharedPreferencesRepoV2 {
  final secureStorage = FlutterSecureStorage();
  late SharedPreferences prefs;
  late String keyPrefix;

  Future<void> initSharedPreferences(String keyPrefix) async {
    this.keyPrefix = keyPrefix;
    prefs = await SharedPreferences.getInstance();

  }

  String _getRealKey(String key) {
    return '$keyPrefix.$key';
  }

  Future<bool> saveData(String key, dynamic value) async {
    var realKey = _getRealKey(key);
    if (value is int) {
      var intValue = cast<int>(value);
      if (intValue != null) {
        return prefs.setInt(realKey, intValue);
      }
    }

    if (value is double) {
      var doubleValue = cast<double>(value);
      if (doubleValue != null) {
        return prefs.setDouble(realKey, doubleValue);
      }
    }

    if (value is String) {
      var strValue = cast<String>(value);
      if (strValue != null) {
        return prefs.setString(realKey, strValue);
      }
    }

    if (value is bool) {
      var boolValue = cast<bool>(value);
      if (boolValue != null) {
        return prefs.setBool(realKey, boolValue);
      }
    }

    return false;
  }

  T readData<T>(String key) {
    return prefs.get(_getRealKey(key)) as T;
  }

  bool isExitKey(String key) {
    return prefs.containsKey(_getRealKey(key));
  }

  Future<bool> removeKey(String key) {
    return prefs.remove(_getRealKey(key));
  }

  Future<void> saveSecureData(String key, String? value) async {
    return await secureStorage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) {
    return secureStorage.read(key: key);
  }

  Future<void> deleteSecureData(String key) async {
    return await secureStorage.delete(key: key);
  }
}
