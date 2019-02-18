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

class SplashState extends BaseState<SplashPresenter, SplashView>
    implements SplashViewCallback {
  bool _noConnectionTextVisibility = false;

  onCheckInternetComplete(bool isConnection) {
    setState(() {
      _noConnectionTextVisibility = !isConnection;
      presenter.listenToConnectivityChanges(!isConnection);
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
  Widget create(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text(Strings.appName),
          Visibility(
              visible: _noConnectionTextVisibility,
              child: MaterialButton(
                  onPressed: () => presenter.checkConnection(),
                  child: Text(Strings.noConnectionButtonText)))
        ])));
  }

  setNoConnectionTextVisibility(bool visible) {
    setState(() {
      _noConnectionTextVisibility = visible;
    });
  }
}
