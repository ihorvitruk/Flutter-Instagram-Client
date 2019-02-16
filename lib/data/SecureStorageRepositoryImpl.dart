import 'package:flutter_instagram_client/domain/repository/SecureStorageRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepositoryImpl extends SecureStorageRepository {
  final storage = FlutterSecureStorage();

  @override
  Future<String> readValue(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future saveValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future deleteValue(String key) async {
    await storage.delete(key: key);
  }
}
