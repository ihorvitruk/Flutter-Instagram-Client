import 'package:flutter_instagram_client/domain/repository/SecureStorageRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepositoryImpl extends SecureStorageRepository {
  static const String STORAGE_KEY_TOKEN = "storage_key_token";

  final storage = FlutterSecureStorage();

  @override
  Future<String> readToken() async {
    return _readValue(STORAGE_KEY_TOKEN);
  }

  @override
  Future<void> saveToken(String value) {
    return _saveValue(STORAGE_KEY_TOKEN, value);
  }

  @override
  Future<void> deleteToken() {
    return _deleteValue(STORAGE_KEY_TOKEN);
  }

  Future<void> _saveValue(String key, String value) async {
    return storage.write(key: key, value: value);
  }

  Future<String> _readValue(String key) async {
    return storage.read(key: key);
  }

  Future<void> _deleteValue(String key) async {
    return storage.delete(key: key);
  }
}
