import 'package:flutter_instagram_client/domain/entity/Entity.dart';

class Post extends Entity {
  final id, url, createdTime, userHasLiked, likesCount, tags, commentsCount;

  Post(this.id, this.url, this.createdTime, this.userHasLiked, this.likesCount,
      this.tags, this.commentsCount);

  Post.empty()
      : id = "",
        url = "",
        createdTime = "",
        userHasLiked = false,
        likesCount = 0,
        tags = List<String>(),
        commentsCount = 0;
}
