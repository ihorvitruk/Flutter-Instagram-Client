import 'package:flutter_telegram_client/presentation/base/BaseViewCallback.dart';

abstract class BasePresenter<V extends BaseViewCallback> {
  V view;
}
