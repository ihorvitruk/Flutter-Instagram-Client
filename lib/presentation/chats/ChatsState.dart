import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseState.dart';
import 'package:flutter_telegram_client/presentation/chats/ChatsPresenter.dart';
import 'package:flutter_telegram_client/presentation/chats/ChatsViewCallback.dart';

class ChatsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatsState();
}

class ChatsState extends BaseState<ChatsPresenter>
    implements ChatsViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Chats"));
  }
}
