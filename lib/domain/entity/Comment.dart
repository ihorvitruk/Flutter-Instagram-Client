import 'package:flutter_instagram_client/domain/entity/Entity.dart';

class Comment extends Entity {
  final id, from, text, createdTime;

  Comment(this.id, this.from, this.text, this.createdTime);

  Comment.empty()
      : id = "",
        from = "",
        text = "",
        createdTime = "";
}
