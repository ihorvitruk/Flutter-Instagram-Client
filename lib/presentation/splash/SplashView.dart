import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/Strings.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/home/HomeView.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashCallback.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPresenter.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashView();
}

class SplashView extends BaseView<SplashPresenter>
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
        push(HomeWidget());
      }
    });
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
