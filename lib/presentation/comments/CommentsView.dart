import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/domain/entity/Comment.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/comments/CommentsCallback.dart';
import 'package:flutter_instagram_client/presentation/comments/CommentsPresenter.dart';

class CommentsView extends BaseView<CommentsState> {
  final postId;

  CommentsView({Key key, @required this.postId});

  @override
  CommentsState state() => CommentsState();
}

class CommentsState extends BaseState<CommentsPresenter, CommentsView>
    implements CommentsViewCallback {
  @override
  void initState() {
    super.initState();
    presenter.loadComments(widget.postId);
  }

  @override
  Widget create(BuildContext context) {
    return Center(child: Text("Comments"));
  }

  @override
  onCommentsLoaded(List<Comment> comments) {
    print(comments);
  }
}
