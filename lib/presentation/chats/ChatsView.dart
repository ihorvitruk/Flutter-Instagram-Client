import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/chats/ChatsPresenter.dart';

class ChatsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatsView();
}

class ChatsView extends BaseView<ChatsPresenter> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Chats"));
  }
}
