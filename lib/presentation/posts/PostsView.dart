import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/domain/entity/Post.dart';
import 'package:flutter_instagram_client/presentation/Strings.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/comments/CommentsView.dart';
import 'package:flutter_instagram_client/presentation/posts/PostsPresenter.dart';
import 'package:flutter_instagram_client/presentation/posts/PostsViewCallback.dart';
import 'package:intl/intl.dart';

class PostsView extends BaseView<PostsState> {
  @override
  PostsState state() => PostsState();
}

class PostsState extends BaseState<PostsPresenter, PostsView>
    implements PostsViewCallback {
  var _posts = List<Post>();

  @override
  Widget create(BuildContext context) => ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = _posts[index];
        final width = MediaQuery.of(context).size.width; //screen width
        final height = post.picture.height * width / post.picture.width;
        return Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: DefaultTextStyle(
                style: TextStyle(color: Colors.black, fontSize: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(post.picture.url,
                          width: width, height: height),
                      Row(children: [
                        Padding(
                            padding: EdgeInsets.all(4),
                            child: _createHeartIcon(post.userHasLiked)),
                        GestureDetector(
                            onTap: () {
                              _goToComments(post.id);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.chat_bubble_outline,
                                  color: Colors.black,
                                )))
                      ]),
                      Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(Strings.likedByPeople(post.likesCount))),
                      Visibility(
                          visible: !post.tags.isEmpty,
                          child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                formatTags(post.tags),
                                style: TextStyle(color: Colors.blue),
                              ))),
                      GestureDetector(
                          onTap: () {
                            _goToComments(post.id);
                          },
                          child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                  Strings.viewComments(post.commentsCount),
                                  style: TextStyle(color: Colors.grey)))),
                      Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(_formatDate(post.createdTime),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)))
                    ])));
      });

  @override
  onPostsLoaded(List<Post> posts) {
    setState(() {
      _posts = posts;
    });
  }

  _goToComments(String postId) {
    push(CommentsView(postId: postId), withReplacement: false);
  }

  _createHeartIcon(bool userHasLiked) => userHasLiked
      ? Icon(Icons.favorite, color: Colors.red)
      : Icon(Icons.favorite_border, color: Colors.black);

  _formatDate(String seconds) {
    return DateFormat("MMMM d, yyyy")
        .format(DateTime.fromMillisecondsSinceEpoch(int.parse(seconds) * 1000));
  }

  formatTags(List<String> tags) => tags.isEmpty ? "" : "#${tags.join(" #")}";
}
