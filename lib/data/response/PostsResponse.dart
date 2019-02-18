import 'package:flutter_instagram_client/data/response/Response.dart';
import 'package:flutter_instagram_client/domain/entity/Post.dart';

class PostsResponse extends ListResponse<Post> {
  PostsResponse(Map<String, dynamic> json) : super(json);

  @override
  Post fromDataJson(Map<String, dynamic> json) => Post(
      json["id"],
      json["images"]["standard_resolution"]["url"],
      json["created_time"],
      json["user_has_liked"],
      json["likes"]["count"],
      json["tags"],
      json["comments"]["count"]);
}
