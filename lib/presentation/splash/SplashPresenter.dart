import 'package:flutter_instagram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_instagram_client/domain/repository/NetworkRepository.dart';
import 'package:flutter_instagram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_instagram_client/presentation/splash/SplashView.dart';

class SplashPresenter extends BasePresenter<SplashState> {
  NetworkRepository _networkRepository;
  AuthRepository _authRepository;

  SplashPresenter(this._networkRepository, this._authRepository);

  checkConnection() async {
    _networkRepository
        .checkConnection()
        .then((isConnection) => view.onCheckInternetComplete(isConnection))
        .catchError((error) => view.onError(error));
  }

  checkAuthorization() async {
    _authRepository
        .getAuthState()
        .then((authState) => view.onCheckAuthorizationComplete(authState))
        .catchError((error) => view.onError(error));
  }
}
