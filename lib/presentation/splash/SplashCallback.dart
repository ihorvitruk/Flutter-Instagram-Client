import 'package:flutter_telegram_client/presentation/base/BaseViewCallback.dart';

abstract class SplashViewCallback extends BaseViewCallback {
  void onCheckInternetComplete(bool isConnection);
}
