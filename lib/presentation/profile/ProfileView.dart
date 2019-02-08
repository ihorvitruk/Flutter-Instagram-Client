import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/profile/ProfilePresenter.dart';

class ProfileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileView();
}

class ProfileView extends BaseView<ProfilePresenter> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }
}
