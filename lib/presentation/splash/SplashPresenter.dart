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
        .then(view.onCheckInternetComplete)
        .catchError(view.onError);
  }

  checkAuthorization() async {
    _authRepository
        .isLoggedIn()
        .then(view.onCheckAuthorizationComplete)
        .catchError(view.onError);
  }
}
