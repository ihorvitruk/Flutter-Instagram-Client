import 'package:flutter_instagram_client/domain/entity/Counts.dart';
import 'package:flutter_instagram_client/domain/entity/Entity.dart';

class Profile extends Entity {
  final String id;
  final String username;
  final String profilePicture;
  final String fullName;
  final String bio;
  final String website;
  final bool isBusiness;
  final Counts counts;

  Profile(this.id, this.username, this.profilePicture, this.fullName, this.bio,
      this.website, this.isBusiness, this.counts);
}
