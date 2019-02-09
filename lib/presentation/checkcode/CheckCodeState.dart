import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseState.dart';
import 'package:flutter_telegram_client/presentation/checkcode/CheckCodePresenter.dart';
import 'package:flutter_telegram_client/presentation/checkcode/CheckCodeViewCallback.dart';

class CheckCodeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckCodeState();
}

class CheckCodeState extends BaseState<CheckCodePresenter>
    implements CheckCodeViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Check Code"));
  }
}
