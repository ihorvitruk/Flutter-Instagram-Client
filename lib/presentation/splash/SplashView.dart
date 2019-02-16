import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/Strings.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/home/HomeView.dart';
import 'package:flutter_instagram_client/presentation/login/LoginView.dart';
import 'package:flutter_instagram_client/presentation/splash/SplashCallback.dart';
import 'package:flutter_instagram_client/presentation/splash/SplashPresenter.dart';

class SplashView extends BaseView<SplashState> {
  @override
  SplashState state() => SplashState();
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

  onCheckAuthorizationComplete(bool isLoggedIn) {
    switch (isLoggedIn) {
      case true:
        push(HomeView());
        break;
      case false:
      default:
        push(LoginView());
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
