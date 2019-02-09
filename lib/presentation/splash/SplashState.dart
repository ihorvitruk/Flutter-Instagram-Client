import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/domain/entity/auth/AuthState.dart';
import 'package:flutter_telegram_client/presentation/Strings.dart';
import 'package:flutter_telegram_client/presentation/base/BaseState.dart';
import 'package:flutter_telegram_client/presentation/checkcode/CheckCodeState.dart';
import 'package:flutter_telegram_client/presentation/home/HomeState.dart';
import 'package:flutter_telegram_client/presentation/login/LoginState.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashCallback.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPresenter.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends BaseState<SplashPresenter>
    implements SplashViewCallback {
  bool _noConnectionVisibility = false;

  @override
  initState() {
    _checkConnection();
    super.initState();
  }

  onCheckInternetComplete(bool isConnection) {
    setState(() {
      _noConnectionVisibility = !isConnection;
      if (isConnection) {
        presenter.checkAuthorization();
      }
    });
  }

  onCheckAuthorizationComplete(AuthState authState) {
    switch (authState) {
      case AuthState.Ok:
        push(HomeWidget());
        break;
      case AuthState.WaitCode:
        push(CheckCodeWidget());
        break;
      case AuthState.WaitPhone:
      default:
        push(LoginWidget());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text(Strings.appName),
          Visibility(
              visible: _noConnectionVisibility,
              child: MaterialButton(
                  onPressed: () => _checkConnection(),
                  child: Text(Strings.noConnectionButtonText)))
        ])));
  }

  _checkConnection() {
    setState(() {
      _noConnectionVisibility = false;
      presenter.checkConnection();
    });
  }
}
