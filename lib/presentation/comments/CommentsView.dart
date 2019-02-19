import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/domain/entity/Comment.dart';
import 'package:flutter_instagram_client/presentation/Strings.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/comments/CommentsCallback.dart';
import 'package:flutter_instagram_client/presentation/comments/CommentsPresenter.dart';
import 'package:timeago/timeago.dart' as timeAgo;

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
            return DefaultTextStyle(
                style: TextStyle(color: Colors.black, fontSize: 16),
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(comment.from,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(comment.text)),
                          Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(_formatTimeAgo(comment.createdTime),
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)))
                        ])));
          }));

  @override
  onCommentsLoaded(List<Comment> comments) {
    setState(() {
      _comments = comments;
    });
  }

  _formatTimeAgo(String createdTime) {
    final millisecondsAgo = Duration(
        milliseconds: DateTime.now().millisecondsSinceEpoch -
            int.parse(createdTime) * 1000);
    return timeAgo.format(DateTime.now().subtract(millisecondsAgo));
  }
}
