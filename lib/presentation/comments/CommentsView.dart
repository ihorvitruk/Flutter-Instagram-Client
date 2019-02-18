import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/comments/CommentsCallback.dart';
import 'package:flutter_instagram_client/presentation/comments/CommentsPresenter.dart';

class CommentsView extends BaseView<CommentsState> {
  @override
  CommentsState state() => CommentsState();
}

class CommentsState extends BaseState<CommentsPresenter>
    implements CommentsViewCallback {
  @override
  Widget create(BuildContext context) {
    return Center(child: Text("Comments"));
  }
}
