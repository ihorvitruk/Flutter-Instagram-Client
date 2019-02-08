import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseViewCallback.dart';

abstract class BasePresenter<V extends BaseViewCallback> {
  @protected
  V view;
}
