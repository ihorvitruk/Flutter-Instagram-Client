import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/profile/ProfilePresenter.dart';
import 'package:flutter_telegram_client/presentation/profile/ProfileViewCallback.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget(Key key) : super(key: key);

  @override
  ProfileView createState() => ProfileView();
}

class ProfileView extends BaseView<ProfileWidget, ProfilePresenter>
    implements ProfileViewCallback {
  static const String _KEY_NUMBER = "number";

  @override
  Widget build(BuildContext context) {
    int number = readStorageValue(_KEY_NUMBER);
    if (number == null) {
      writeStorageValue(_KEY_NUMBER, Random().nextInt(1000));
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
