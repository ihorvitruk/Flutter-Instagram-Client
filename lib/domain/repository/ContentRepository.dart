import 'package:flutter_instagram_client/domain/entity/Post.dart';
import 'package:flutter_instagram_client/domain/entity/Profile.dart';

abstract class ContentRepository {
  Future<Profile> getProfile();

  Future<List<Post>> getPosts();
}
