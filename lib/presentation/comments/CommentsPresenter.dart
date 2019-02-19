import 'package:flutter_instagram_client/domain/repository/ContentRepository.dart';
import 'package:flutter_instagram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_instagram_client/presentation/comments/CommentsCallback.dart';

class CommentsPresenter extends BasePresenter<CommentsViewCallback> {
  ContentRepository _contentRepository;

  CommentsPresenter(this._contentRepository);

  loadComments(String postId) {
    view.showProgress(contentVisible: true);
    _contentRepository.getComments(postId).then((comments) {
      view.onCommentsLoaded(comments);
      view.hideProgress();
    }).catchError((error) {
      view.hideProgress();
    });
  }
}
