import 'package:flutter_instagram_client/domain/entity/Post.dart';
import 'package:flutter_instagram_client/presentation/base/BaseViewCallback.dart';

abstract class PostsViewCallback extends BaseViewCallback {
  onPostsLoaded(List<Post> posts);
}
