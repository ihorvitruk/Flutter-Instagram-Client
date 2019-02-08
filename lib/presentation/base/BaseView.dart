import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_telegram_client/presentation/base/BaseViewCallback.dart';

abstract class BaseView<P extends BasePresenter> extends State<StatefulWidget>
    implements BaseViewCallback {
  @protected
  P presenter;

  void onError(Object error) {
    print(error);
  }
}
