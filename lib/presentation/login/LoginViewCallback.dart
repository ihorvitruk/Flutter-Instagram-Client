import 'package:flutter_instagram_client/presentation/base/BaseViewCallback.dart';

abstract class LoginViewCallback extends BaseViewCallback {
  onAuthorized(bool authorized);
}
