import 'package:flutter_instagram_client/domain/entity/Comment.dart';
import 'package:flutter_instagram_client/presentation/base/BaseViewCallback.dart';

abstract class CommentsViewCallback extends BaseViewCallback {
  onCommentsLoaded(List<Comment> comments);
}
