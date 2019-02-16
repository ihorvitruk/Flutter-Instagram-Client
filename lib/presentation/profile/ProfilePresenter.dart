import 'package:flutter_instagram_client/domain/repository/ContentRepository.dart';
import 'package:flutter_instagram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfileViewCallback.dart';

class ProfilePresenter extends BasePresenter<ProfileViewCallback> {
  ContentRepository _contentRepository;

  ProfilePresenter(this._contentRepository);

  @override
  init() {
    _loadProfile();
    super.init();
  }

  @override
  onConnectionChanged(bool isConnection) {
    _loadProfile();
  }

  _loadProfile() {
    view.showProgress();
    _contentRepository.getProfile().then((profile) {
      view.onProfileLoaded(profile);
      view.hideProgress();
    }).catchError(view.onError);
  }
}
