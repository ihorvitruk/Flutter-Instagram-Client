import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_telegram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_telegram_client/presentation/base/BaseViewCallback.dart';

abstract class BaseView<P extends BasePresenter> extends State<StatefulWidget>
    implements BaseViewCallback {
  @protected
  P presenter;

  BaseView() {
    presenter = Injector.getInjector().get();
    presenter.view = this;
  }

  onError(Object error) {
    print(error);
  }

  @protected
  writeStorageValue<T>(Object key, T value) {
    PageStorage.of(context).writeState(context, value, identifier: key);
  }

  @protected
  T readStorageValue<T>(Object key) {
    return PageStorage.of(context).readState(context, identifier: key);
  }

  @protected
  push(Widget widget, {bool withReplacement = true}) {
    var route = MaterialPageRoute(builder: (context) => widget);
    if (withReplacement) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }
}
