import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  //singleton instance
  static final SecureStorageService _instance =
      SecureStorageService._internal(); //This creates a private static final instance of the class.

  factory SecureStorageService() => _instance;

  SecureStorageService._internal();
  // Instance of Fluttersecurestorage
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  //save data
  Future<bool> setValue(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
    return true;
  }

  //retrieve data
  Future<dynamic> readValue(String key) async {
    return await _secureStorage.read(key: key);
  }

  // delete data
  Future<bool> clearValue(String key) async {
    await _secureStorage.delete(key: key);
    return true;
  }
}
