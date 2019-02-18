import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/domain/entity/Post.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/posts/PostsPresenter.dart';
import 'package:flutter_instagram_client/presentation/posts/PostsViewCallback.dart';

class PostsView extends BaseView<PostsState> {
  @override
  PostsState state() => PostsState();
}

class PostsState extends BaseState<PostsPresenter>
    implements PostsViewCallback {
  var _posts = List<Post>();

  @override
  Widget create(BuildContext context) => ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = _posts[index];
        return Column(children: [
          Image.network(post.url),
          Text("User liked: ${post.userHasLiked}"),
          Text("Liked by ${post.likesCount} people"),
          Text("#${post.tags.join(" #")}"),
          Text("View ${post.commentsCount} comments"),
          Text("Timestamp: ${post.createdTime}")
        ]);
      });

  @override
  onPostsLoaded(List<Post> posts) {
    setState(() {
      _posts = posts;
    });
  }
}
