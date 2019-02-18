import 'package:flutter_instagram_client/data/response/Response.dart';
import 'package:flutter_instagram_client/domain/entity/Comment.dart';

class CommentsResponse extends ListResponse<Comment> {
  CommentsResponse(Map<String, dynamic> json) : super(json);

  @override
  fromDataJson(Map<String, dynamic> json) => Comment(
      json["id"], json["from"]["username"], json["text"], json["created_time"]);
}
