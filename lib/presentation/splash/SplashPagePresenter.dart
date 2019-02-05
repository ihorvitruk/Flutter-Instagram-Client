import 'package:flutter_telegram_client/domain/NetworkRepository.dart';
import 'package:flutter_telegram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPageState.dart';

class SplashPagePresenter extends BasePresenter {

  NetworkRepository _networkRepository;

  SplashPagePresenter(this._networkRepository);

  void checkConnection() async {
    Future.delayed(
        Duration(seconds: 5),
        () => _networkRepository
            .checkConnection()
            .then((isConnection) =>
                splashPageState?.onCheckInternetComplete(isConnection))
            .catchError((error) => splashPageState?.onError(error)));
  }
}
