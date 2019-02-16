import 'dart:convert';

import 'package:flutter_instagram_client/data/response/ProfileResponse.dart';
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
  Future<Profile> getProfile() async {
    final uri = Uri.https(_hostUrl, "/v1/users/self", await _params());
    Response response = await http.get(uri);
    return ProfileResponse(jsonDecode(response.body)).data;
  }

  Future<Map<String, String>> _params() async {
    final accessToken = await _secureStorageRepository.readToken();
    return {Strings.accessToken: accessToken};
  }
}
