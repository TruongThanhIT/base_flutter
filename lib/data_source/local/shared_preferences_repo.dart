import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

class BaseSharedPreferencesRepo {
  final box = GetStorage();
  final secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  Future<bool> initGetStorage({String container = 'GetStorage'}) async {
    return await GetStorage.init(container);
  }

  Future<void> saveData(String key, dynamic value) async {
    return await box.write(key, value);
  }

  T readData<T>(String key) {
    return box.read(key);
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
