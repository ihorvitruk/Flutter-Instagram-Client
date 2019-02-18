import 'package:flutter_instagram_client/domain/entity/Profile.dart';
import 'package:flutter_instagram_client/presentation/base/BaseViewCallback.dart';

abstract class ProfileViewCallback extends BaseViewCallback {
  onProfileLoaded(Profile profile);
  onLogoutSuccess(bool success);
}
