abstract class SecureStorageRepository {
  Future<void> saveToken(String value);

  Future<String> readToken();

  Future<void> deleteToken();
}
