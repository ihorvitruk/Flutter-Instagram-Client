import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseState.dart';
import 'package:flutter_telegram_client/presentation/login/LoginPresenter.dart';
import 'package:flutter_telegram_client/presentation/login/LoginViewCallback.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends BaseState<LoginPresenter> implements LoginViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Login"));
  }
}
