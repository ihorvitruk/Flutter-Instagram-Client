import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/checkcode/CheckCodePresenter.dart';
import 'package:flutter_telegram_client/presentation/checkcode/CheckCodeViewCallback.dart';

class CheckCodeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckCodeView();
}

class CheckCodeView extends BaseView<CheckCodePresenter>
    implements CheckCodeViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Check Code"));
  }
}
