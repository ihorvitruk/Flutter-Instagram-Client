import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_instagram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_instagram_client/domain/repository/SecureStorageRepository.dart';
import 'package:flutter_instagram_client/presentation/Strings.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImpl extends AuthRepository {
  static const String API_AUTH = "/oauth/authorize";
  static const String API_TOKEN = "/oauth/access_token";
  static const String REDIRECT_URI = "http://localhost:8585";

  static const String APP_ID_KEY = "appId";
  static const String APP_SECRET_KEY = "appSecret";

  String _hostUrl;

  SecureStorageRepository _secureStorageRepository;

  AuthRepositoryImpl(this._hostUrl, this._secureStorageRepository);

  @override
  Future<bool> isLoggedIn() async {
    final token = await _secureStorageRepository.readToken();
    return Future.value(token != null);
  }

  @override
  Future<bool> authorize() async {
    final onCode = await _server();
    final webView = new FlutterWebviewPlugin();

    Map<String, dynamic> appCredentials =
        await parseJsonFromAssets("assets/creds.json");
    String appId = appCredentials[APP_ID_KEY];
    String appSecret = appCredentials[APP_SECRET_KEY];

    final commonParams = {
      "client_id": appId,
      "redirect_uri": REDIRECT_URI,
    };

    final authParams = Map<String, String>();
    authParams.addAll(commonParams);
    authParams.addAll({"response_type": "code"});

    final authUrl = Uri.https(_hostUrl, API_AUTH, authParams);
    webView.launch(authUrl.toString());

    final code = await onCode.first;
    final tokenUrl = Uri.https(_hostUrl, API_TOKEN);

    final tokenRequestBody = Map<String, String>();
    tokenRequestBody.addAll(commonParams);
    tokenRequestBody.addAll({
      "client_secret": appSecret,
      "code": code,
      "grant_type": "authorization_code"
    });
    final response =
        await http.post(tokenUrl.toString(), body: tokenRequestBody);
    webView.cleanCookies();
    webView.close();

    Map<String, dynamic> tokenParams = jsonDecode(response.body);
    await _secureStorageRepository.saveToken(tokenParams[Strings.accessToken]);
    return isLoggedIn();
  }

  @override
  Future<bool> logout() async {
    await _secureStorageRepository.deleteToken();
    return true;
  }

  Future<Stream<String>> _server() async {
    final onCode = new StreamController<String>();
    HttpServer server =
        await HttpServer.bind(InternetAddress.loopbackIPv4, 8585, shared: true);
    server.listen((HttpRequest request) async {
      final code = request.uri.queryParameters["code"];
      request.response
        ..statusCode = 200
        ..headers.set("Content-Type", ContentType.html.mimeType);
      await request.response.close();
      await server.close(force: true);
      onCode.add(code);
      await onCode.close();
    });
    return onCode.stream;
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
