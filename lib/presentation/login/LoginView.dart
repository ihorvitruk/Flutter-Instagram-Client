import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/login/LoginPresenter.dart';
import 'package:flutter_telegram_client/presentation/login/LoginViewCallback.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginView();
}

class LoginView extends BaseView<LoginPresenter> implements LoginViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Login"));
  }
}
