import 'package:flutter_instagram_client/domain/entity/Counts.dart';
import 'package:flutter_instagram_client/domain/entity/Entity.dart';

class Profile extends Entity {
  final id; //-
  final username; //+
  final profilePicture; //+
  final fullName; //+
  final bio; //+
  final website;
  final isBusiness;
  final counts;

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
