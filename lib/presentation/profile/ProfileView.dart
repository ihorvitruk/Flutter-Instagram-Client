import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/profile/ProfilePresenter.dart';
import 'package:flutter_telegram_client/presentation/profile/ProfileViewCallback.dart';

class ProfileView extends BaseView<ProfileState> {
  @override
  ProfileState state() => ProfileState();
}

class ProfileState extends BaseState<ProfilePresenter>
    implements ProfileViewCallback {
  static const String _KEY_NUMBER = "number";

  @override
  Widget build(BuildContext context) {
    int number = readStorageValue(_KEY_NUMBER);
    if (number == null) {
      number = Random().nextInt(1000);
      writeStorageValue(_KEY_NUMBER, number);
    }
    return Center(
        child: MaterialButton(
            onPressed: () {
              setState(() {
                writeStorageValue(_KEY_NUMBER, ++number);
              });
            },
            child: Text("Number $number")));
  }
}
