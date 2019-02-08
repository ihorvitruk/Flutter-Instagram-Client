import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseState.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPagePresenter.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPageView.dart';

class SplashPageState extends BaseState<SplashPage, SplashPagePresenter> {
  String _text = "Splash page";

  SplashPageState() {
    presenter.splashPageState = this;
  }

  @override
  void initState() {
    super.initState();
    presenter.checkConnection();
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

  void onError(Object error) {
    print(error);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text(_text, style: TextStyle(color: Colors.red))));
  }
}
