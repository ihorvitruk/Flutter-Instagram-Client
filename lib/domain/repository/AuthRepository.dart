abstract class AuthRepository {

  Future<bool> isLoggedIn();

  Future<bool> authorize();

  Future<bool> logout();
}
