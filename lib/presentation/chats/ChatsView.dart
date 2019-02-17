import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/chats/ChatsPresenter.dart';
import 'package:flutter_instagram_client/presentation/chats/ChatsViewCallback.dart';

class ChatsView extends BaseView<ChatsState> {
  @override
  ChatsState state() => ChatsState();
}

class ChatsState extends BaseState<ChatsPresenter>
    implements ChatsViewCallback {
  @override
  Widget create(BuildContext context) {
    return Center(child: Text("Chats"));
  }
}
