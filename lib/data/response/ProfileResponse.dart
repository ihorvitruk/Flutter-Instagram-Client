import 'package:flutter_instagram_client/data/response/Response.dart';
import 'package:flutter_instagram_client/domain/entity/Counts.dart';
import 'package:flutter_instagram_client/domain/entity/Profile.dart';

class ProfileResponse extends Response<Profile> {
  ProfileResponse(Map<String, dynamic> json) : super(json);

  @override
  Profile fromDataJson(Map<String, dynamic> json) => Profile(
      json["id"],
      json["username"],
      json["profile_picture"],
      json["full_name"],
      json["bio"],
      json["website"],
      json["is_business"],
      _fromCountsJson(json["counts"]));

  Counts _fromCountsJson(Map<String, dynamic> json) =>
      Counts(json["media"], json["follows"], json["followed_by"]);
}
