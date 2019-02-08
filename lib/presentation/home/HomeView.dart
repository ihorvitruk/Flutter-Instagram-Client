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

class HomeView extends BaseView<HomeWidget, HomePresenter>
    implements HomeViewCallback {
  static const int _INDEX_CONTACTS = 0;
  static const int _INDEX_CHATS = 1;
  static const int _INDEX_PROFILE = 2;

  static final Key _keyContacts = PageStorageKey(_INDEX_CONTACTS);
  static final Key _keyChats = PageStorageKey(_INDEX_CHATS);
  static final Key _keyProfile = PageStorageKey(_INDEX_PROFILE);

  int _currentIndex = _INDEX_CONTACTS;

  PageStorageBucket _bucket = PageStorageBucket();

  ContactsWidget _contactsWidget;
  ChatsWidget _chatsWidget;
  ProfileWidget _profileWidget;

  List<Widget> _children;

  Widget _currentChild;

  @override
  void initState() {
    _contactsWidget = ContactsWidget(_keyContacts);
    _chatsWidget = ChatsWidget(_keyChats);
    _profileWidget = ProfileWidget(_keyProfile);
    _children = [_contactsWidget, _chatsWidget, _profileWidget];
    _currentChild = _contactsWidget;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.appName)),
      body: PageStorage(bucket: _bucket, child: _currentChild),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
              _currentIndex = index;
              _currentChild = _children[index];
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
