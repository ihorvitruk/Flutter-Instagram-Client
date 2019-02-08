import 'package:flutter_telegram_client/domain/NetworkRepository.dart';
import 'package:flutter_telegram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashView.dart';

class SplashPresenter extends BasePresenter<SplashView> {
  NetworkRepository _networkRepository;

  SplashPresenter(this._networkRepository);

  checkConnection() async {
    Future.delayed(
        Duration(seconds: 5),
        () => _networkRepository
            .checkConnection()
            .then((isConnection) => view.onCheckInternetComplete(isConnection))
            .catchError((error) => view.onError(error)));
  }
}
