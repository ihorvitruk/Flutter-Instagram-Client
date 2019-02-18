import 'package:flutter_instagram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_instagram_client/domain/repository/ContentRepository.dart';
import 'package:flutter_instagram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfileViewCallback.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class ProfilePresenter extends BasePresenter<ProfileViewCallback> {
  ContentRepository _contentRepository;
  AuthRepository _authRepository;

  ProfilePresenter(this._contentRepository, this._authRepository);

  @override
  init() {
    super.init();
    _loadProfile();
  }

  @override
  onConnectionChanged(bool isConnection) {
    if (isConnection) {
      _loadProfile();
    }
  }

  onWebsiteLinkTap(String link) {
    urlLauncher.launch(link);
  }

  onLogoutTap() async {
    view.showProgress(contentVisible: true);
    final logoutSuccess = await _authRepository.logout();
    view.hideProgress();
    view.onLogoutSuccess(logoutSuccess);
  }

  _loadProfile() {
    view.showProgress();
    _contentRepository.getProfile().then((profile) {
      view.onProfileLoaded(profile);
      view.hideProgress();
    }).catchError((error) {
      view.onError(error);
      view.hideProgress();
    });
  }
}
