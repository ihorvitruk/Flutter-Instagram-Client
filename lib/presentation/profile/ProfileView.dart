import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/domain/entity/Profile.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfilePresenter.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfileViewCallback.dart';

class ProfileView extends BaseView<ProfileState> {
  @override
  ProfileState state() => ProfileState();
}

class ProfileState extends BaseState<ProfilePresenter>
    implements ProfileViewCallback {
  static const String _KEY_NUMBER = "number";

  String _profileText = "";
  String _profileImageUrl = "";
  bool _progressIndicatorVisible = false;

  @override
  Widget build(BuildContext context) {
    int number = readStorageValue(_KEY_NUMBER);
    if (number == null) {
      number = Random().nextInt(1000);
      writeStorageValue(_KEY_NUMBER, number);
    }
    return Stack(children: [
      Center(
          child: Column(children: [
        MaterialButton(
            onPressed: () {
              setState(() {
                writeStorageValue(_KEY_NUMBER, ++number);
              });
            },
            child: Text("Number $number")),
        Image.network(_profileImageUrl),
        Text(
          _profileText,
          style: TextStyle(color: Colors.black),
        )
      ])),
      Visibility(
          visible: _progressIndicatorVisible,
          child: CircularProgressIndicator()),
    ]);
  }

  @override
  showProgress() {
    setState(() {
      _progressIndicatorVisible = true;
    });
  }

  @override
  hideProgress() {
    _progressIndicatorVisible = false;
  }

  @override
  onProfileLoaded(Profile profile) {
    setState(() {
      _profileText = profile.toString();
      _profileImageUrl = profile.profilePicture;
    });
  }
}
