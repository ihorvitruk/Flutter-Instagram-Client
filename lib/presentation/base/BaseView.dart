import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_instagram_client/presentation/base/BaseViewCallback.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

abstract class BaseView<S extends State<StatefulWidget>>
    extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => state();

  S state();
}

abstract class BaseState<P extends BasePresenter> extends State<BaseView>
    implements BaseViewCallback {
  @protected
  P presenter;

  BaseState() {
    presenter = Injector.getInjector().get();
    presenter.view = this;
  }

  @override
  void initState() {
    presenter.init();
    super.initState();
  }

  @override
  dispose() {
    presenter.dispose();
    super.dispose();
  }

  @override
  showProgress() {}

  @override
  hideProgress() {}

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
  push(BaseView view, {bool withReplacement = true}) {
    final route = MaterialPageRoute(builder: (context) => view);
    if (withReplacement) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }
}
