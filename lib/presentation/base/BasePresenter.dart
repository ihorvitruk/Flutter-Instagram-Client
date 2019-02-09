import 'package:flutter_instagram_client/presentation/base/BaseViewCallback.dart';

abstract class BasePresenter<V extends BaseViewCallback> {
  V view;
}
