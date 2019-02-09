import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/Strings.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/chats/ChatsView.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsView.dart';
import 'package:flutter_telegram_client/presentation/home/HomePresenter.dart';
import 'package:flutter_telegram_client/presentation/home/HomeViewCallback.dart';
import 'package:flutter_telegram_client/presentation/profile/ProfileView.dart';

class HomeView extends BaseView<HomeState> {
  @override
  HomeState state() => HomeState();
}

class HomeState extends BaseState<HomePresenter> implements HomeViewCallback {
  int _currentIndex = 0;
  List<BaseView> _children = [ContactsView(), ChatsView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.appName)),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
              _currentIndex = index;
            }),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              title: Text(Strings.bottomBarContacts)),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), title: Text(Strings.bottomBarChats)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text(Strings.bottomBarProfile))
        ],
      ),
    );
  }
}
