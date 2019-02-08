import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPagePresenter.dart';

class SplashPageView extends BaseView<SplashPagePresenter> {
  String _text = "Splash page";

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
  void onError(Object error) {
    print(error);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text(_text, style: TextStyle(color: Colors.red))));
  }
}
