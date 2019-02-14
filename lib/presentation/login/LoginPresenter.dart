import 'package:flutter_instagram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_instagram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_instagram_client/presentation/login/LoginViewCallback.dart';

class LoginPresenter extends BasePresenter<LoginViewCallback> {
  AuthRepository _authRepository;

  LoginPresenter(this._authRepository);

  authorize() async {
    _authRepository
        .getToken()
        .then(view.onTokenReceived)
        .catchError(view.onError);
  }
}
