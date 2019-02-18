import 'package:flutter_instagram_client/domain/repository/ContentRepository.dart';
import 'package:flutter_instagram_client/presentation/base/BasePresenter.dart';
import 'package:flutter_instagram_client/presentation/posts/PostsViewCallback.dart';

class PostsPresenter extends BasePresenter<PostsViewCallback> {
  ContentRepository _contentRepository;

  PostsPresenter(this._contentRepository);

  init() {
    super.init();
    _loadPosts();
  }

  @override
  onConnectionChanged(bool isConnection) {
    if (isConnection) {
      _loadPosts();
    }
  }

  _loadPosts() {
    view.showProgress();
    _contentRepository.getPosts().then((posts) {
      view.onPostsLoaded(posts);
      view.hideProgress();
    }).catchError((error) {
      view.onError(error);
      view.hideProgress();
    });
  }
}
