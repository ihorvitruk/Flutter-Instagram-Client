import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/chats/ChatsPresenter.dart';
import 'package:flutter_telegram_client/presentation/chats/ChatsViewCallback.dart';

class ChatsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatsView();
}

class ChatsView extends BaseView<ChatsPresenter>
    with AutomaticKeepAliveClientMixin
    implements ChatsViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Chats"));
  }

  @override
  bool get wantKeepAlive => true;
}
