abstract class SecureStorageRepository {
  Future<void> saveValue(String key, String value);

  Future<String> readValue(String key);

  Future<void> deleteValue(String key);
}
