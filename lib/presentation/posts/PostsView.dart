import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/posts/PostsPresenter.dart';
import 'package:flutter_instagram_client/presentation/posts/PostsViewCallback.dart';

class PostsView extends BaseView<PostsState> {
  @override
  PostsState state() => PostsState();
}

class PostsState extends BaseState<PostsPresenter>
    implements PostsViewCallback {
  @override
  Widget create(BuildContext context) {
    return Center(child: Text("Posts"));
  }
}
