import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/home/HomeView.dart';
import 'package:flutter_instagram_client/presentation/login/LoginPresenter.dart';
import 'package:flutter_instagram_client/presentation/login/LoginViewCallback.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LoginView extends BaseView<LoginState> {
  @override
  LoginState state() => LoginState();
}

class LoginState extends BaseState<LoginPresenter>
    implements LoginViewCallback {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(url: null);
  }

  @override
  onAuthorized(bool authorized) {
    if (authorized) {
      push(HomeView(), withReplacement: true);
    }
  }
}
