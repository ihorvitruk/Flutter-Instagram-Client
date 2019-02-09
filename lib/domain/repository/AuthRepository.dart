import 'package:flutter_instagram_client/domain/entity/auth/AuthState.dart';

abstract class AuthRepository {
  Future<AuthState> getAuthState();

  Future<bool> sendPhone(String phone);

  Future<bool> sendCode(int code);

  Future<bool> logout();
}