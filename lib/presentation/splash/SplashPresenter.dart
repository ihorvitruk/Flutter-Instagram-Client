import 'package:flutter_instagram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_instagram_client/domain/repository/NetworkRepository.dart';
import 'package:flutter_instagram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_instagram_client/presentation/splash/SplashView.dart';

class SplashPresenter extends BasePresenter<SplashState> {
  NetworkRepository _networkRepository;
  AuthRepository _authRepository;

  SplashPresenter(this._networkRepository, this._authRepository);

  @override
  init() {
    super.init();
    listenToConnectivityChanges(false);
    checkConnection();
  }

  checkConnection() async {
    view.setNoConnectionTextVisibility(false);
    _networkRepository
        .checkConnection()
        .then((connectivityResult) =>
            view.onCheckInternetComplete(isConnection(connectivityResult)))
        .catchError(view.onError);
  }

  checkAuthorization() async {
    _authRepository
        .isLoggedIn()
        .then(view.onCheckAuthorizationComplete)
        .catchError(view.onError);
  }

  @override
  onConnectionChanged(bool isConnection) =>
      view.onCheckInternetComplete(isConnection);
}
