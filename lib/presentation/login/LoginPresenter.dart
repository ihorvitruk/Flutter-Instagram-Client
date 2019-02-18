import 'package:flutter_instagram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_instagram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_instagram_client/presentation/login/LoginViewCallback.dart';

class LoginPresenter extends BasePresenter<LoginViewCallback> {
  AuthRepository _authRepository;

  LoginPresenter(this._authRepository);

  @override
  init() {
    super.init();
    _authorize();
  }

  _authorize() async {
    _authRepository
        .authorize()
        .then(view.onAuthorized)
        .catchError(view.onError);
  }
}
