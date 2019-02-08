import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/Strings.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/chats/ChatsView.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsView.dart';
import 'package:flutter_telegram_client/presentation/home/HomePresenter.dart';
import 'package:flutter_telegram_client/presentation/home/HomeViewCallback.dart';
import 'package:flutter_telegram_client/presentation/profile/ProfileView.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeView();
}

class HomeView extends BaseView<HomePresenter> implements HomeViewCallback {
  static const int _INDEX_CONTACTS = 0;
  static const int _INDEX_CHATS = 1;
  static const int _INDEX_PROFILE = 2;

  int _currentIndex = _INDEX_CONTACTS;

  ContactsWidget _contactsWidget = ContactsWidget();
  ChatsWidget _chatsWidget = ChatsWidget();
  ProfileWidget _profileWidget = ProfileWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.appName)),
      body: getChild(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => _currentIndex = index),
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

  Widget getChild(int index) {
    switch (index) {
      case _INDEX_CONTACTS:
        return _contactsWidget;
        break;
      case _INDEX_CHATS:
        return _chatsWidget;
        break;
      case _INDEX_PROFILE:
      default:
        return _profileWidget;
        break;
    }
  }
}
