import 'package:flutter_instagram_client/domain/entity/Entity.dart';

class Counts extends Entity {
  final media;
  final follows;
  final followedBy;

  Counts(this.media, this.follows, this.followedBy);

  Counts.empty()
      : media = 0,
        follows = 0,
        followedBy = 0;
}
