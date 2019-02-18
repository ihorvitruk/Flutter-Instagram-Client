import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/home/HomeView.dart';
import 'package:flutter_instagram_client/presentation/login/LoginPresenter.dart';
import 'package:flutter_instagram_client/presentation/login/LoginViewCallback.dart';

class LoginView extends BaseView<LoginState> {
  @override
  LoginState state() => LoginState();
}

class LoginState extends BaseState<LoginPresenter, LoginView>
    implements LoginViewCallback {
  @override
  Widget create(BuildContext context) => Scaffold();

  @override
  onAuthorized(bool authorized) {
    if (authorized) {
      push(HomeView());
    }
  }
}
