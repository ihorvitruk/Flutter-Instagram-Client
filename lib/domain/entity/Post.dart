import 'package:flutter_instagram_client/domain/entity/Entity.dart';

class Post extends Entity {
  final id, createdTime, userHasLiked, likesCount, tags, commentsCount;
  final Picture picture;

  Post(this.id, this.picture, this.createdTime, this.userHasLiked,
      this.likesCount, this.tags, this.commentsCount);

  Post.empty()
      : id = "",
        picture = Picture.empty(),
        createdTime = "",
        userHasLiked = false,
        likesCount = 0,
        tags = List<String>(),
        commentsCount = 0;
}

class Picture extends Entity {
  final url;
  final int width, height;

  Picture(this.url, this.width, this.height);

  Picture.empty()
      : url = "",
        width = 0,
        height = 0;
}
