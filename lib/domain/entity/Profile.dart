import 'package:flutter_instagram_client/domain/entity/Entity.dart';

class Profile extends Entity {
  final id,
      username,
      profilePicture,
      fullName,
      bio,
      website,
      isBusiness,
      counts;

  Profile(this.id, this.username, this.profilePicture, this.fullName, this.bio,
      this.website, this.isBusiness, this.counts);

  Profile.empty()
      : id = "",
        username = "",
        profilePicture = "",
        fullName = "",
        bio = "",
        website = "",
        isBusiness = false,
        counts = Counts.empty();
}

class Counts extends Entity {
  final media, follows, followedBy;

  Counts(this.media, this.follows, this.followedBy);

  Counts.empty()
      : media = 0,
        follows = 0,
        followedBy = 0;
}
