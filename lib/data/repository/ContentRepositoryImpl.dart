import 'dart:convert';

import 'package:flutter_instagram_client/data/response/CommentsResponse.dart';
import 'package:flutter_instagram_client/data/response/PostsResponse.dart';
import 'package:flutter_instagram_client/data/response/ProfileResponse.dart';
import 'package:flutter_instagram_client/domain/entity/Comment.dart';
import 'package:flutter_instagram_client/domain/entity/Post.dart';
import 'package:flutter_instagram_client/domain/entity/Profile.dart';
import 'package:flutter_instagram_client/domain/repository/ContentRepository.dart';
import 'package:flutter_instagram_client/domain/repository/SecureStorageRepository.dart';
import 'package:flutter_instagram_client/presentation/Strings.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ContentRepositoryImpl extends ContentRepository {
  String _hostUrl;
  SecureStorageRepository _secureStorageRepository;

  ContentRepositoryImpl(this._hostUrl, this._secureStorageRepository);

  @override
  Future<Profile> getProfile() async =>
      ProfileResponse(await _request("/v1/users/self")).data;

  @override
  Future<List<Post>> getPosts() async =>
      PostsResponse(await _request("/v1/users/self/media/recent")).data;

  @override
  Future<List<Comment>> getComments(String postId) async =>
      CommentsResponse(await _request("/v1/media/$postId/comments")).data;

  Future<Map<String, dynamic>> _request<D>(String endpoint) async {
    final uri = Uri.https(_hostUrl, endpoint, await _params());
    Response response = await http.get(uri);
    return jsonDecode(response.body);
  }

  Future<Map<String, String>> _params() async {
    final accessToken = await _secureStorageRepository.readToken();
    return {Strings.accessToken: accessToken};
  }
}
