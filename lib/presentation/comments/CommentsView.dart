import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/domain/entity/Comment.dart';
import 'package:flutter_instagram_client/presentation/Strings.dart';
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
  var _comments = List<Comment>();

  @override
  void initState() {
    super.initState();
    presenter.loadComments(widget.postId);
  }

  @override
  Widget create(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(Strings.titleComments)),
      body: ListView.builder(
          itemCount: _comments.length,
          itemBuilder: (BuildContext context, int index) {
            final comment = _comments[index];
            return Padding(
                padding: EdgeInsets.all(12),
                child: Column(children: [
                  Text(comment.from),
                  Text(comment.text),
                  Text(comment.createdTime)
                ]));
          }));

  @override
  onCommentsLoaded(List<Comment> comments) {
    setState(() {
      _comments = comments;
    });
  }
}
