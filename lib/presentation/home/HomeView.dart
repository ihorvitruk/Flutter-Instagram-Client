import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/Strings.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/home/HomePresenter.dart';
import 'package:flutter_instagram_client/presentation/home/HomeViewCallback.dart';
import 'package:flutter_instagram_client/presentation/posts/PostsView.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfileView.dart';

class HomeView extends BaseView<HomeState> {
  @override
  HomeState state() => HomeState();
}

class HomeState extends BaseState<HomePresenter> implements HomeViewCallback {
  int _currentIndex = 0;
  List<BaseView> _children = [PostsView(), ProfileView()];

  @override
  Widget create(BuildContext context) {
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
              icon: Icon(Icons.collections),
              title: Text(Strings.bottomBarPosts)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text(Strings.bottomBarProfile))
        ],
      ),
    );
  }
}
