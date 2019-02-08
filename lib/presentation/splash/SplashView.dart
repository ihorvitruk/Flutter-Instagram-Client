import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashCallback.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPresenter.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashView();
}

class SplashView extends BaseView<SplashPresenter>
    implements SplashViewCallback {
  String _text = "Splash view";

  @override
  void initState() {
    presenter.checkConnection();
    super.initState();
  }

  void onCheckInternetComplete(bool isConnection) {
    setState(() {
      if (isConnection) {
        _text = "Ok connection";
      } else {
        _text = "No connection";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text(_text, style: TextStyle(color: Colors.red))));
  }
}
