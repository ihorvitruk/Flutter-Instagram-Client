import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_telegram_client/presentation/base/BasePresenter.dart';

abstract class BaseState<V extends StatefulWidget, P extends BasePresenter>
    extends State<V> {
  @protected
  var injector = Injector.getInjector();

  @protected
  P presenter;

  BaseState() {
    presenter = injector.get();
    presenter.
  }
}
