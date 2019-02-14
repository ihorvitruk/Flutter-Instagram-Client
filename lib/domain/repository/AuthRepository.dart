import 'package:flutter_instagram_client/domain/entity/auth/AuthState.dart';

abstract class AuthRepository {
  Future<AuthState> getAuthState();

  Future<String> getToken();
}
