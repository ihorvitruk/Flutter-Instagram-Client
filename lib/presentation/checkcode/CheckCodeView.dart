import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/checkcode/CheckCodePresenter.dart';
import 'package:flutter_instagram_client/presentation/checkcode/CheckCodeViewCallback.dart';

class CheckCodeView extends BaseView<CheckCodeState> {
  @override
  CheckCodeState state() => CheckCodeState();
}

class CheckCodeState extends BaseState<CheckCodePresenter>
    implements CheckCodeViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Check Code"));
  }
}
