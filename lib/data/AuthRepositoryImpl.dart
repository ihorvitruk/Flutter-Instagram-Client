import 'package:flutter_telegram_client/domain/entity/auth/AuthState.dart';
import 'package:flutter_telegram_client/domain/repository/AuthRepository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<AuthState> getAuthState() {
    return Future.value(AuthState.Ok);
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    return null;
  }

  @override
  Future<bool> sendCode(int code) {
    // TODO: implement sendCode
    return null;
  }

  @override
  Future<bool> sendPhone(String phone) {
    // TODO: implement sendPhone
    return null;
  }
}
