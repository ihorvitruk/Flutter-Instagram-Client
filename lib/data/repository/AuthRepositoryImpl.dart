import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_instagram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_instagram_client/domain/repository/SecureStorageRepository.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImpl extends AuthRepository {
  static const String API_AUTH = "/oauth/authorize";
  static const String API_TOKEN = "/oauth/access_token";
  static const String REDIRECT_URI = "http://localhost:8585";

  static const String APP_ID_KEY = "appId";
  static const String APP_SECRET_KEY = "appSecret";

  static const String STORAGE_KEY_TOKEN = "storage_key_token";

  String _apiUrl;

  SecureStorageRepository _secureStorageRepository;

  AuthRepositoryImpl(this._apiUrl, this._secureStorageRepository);

  @override
  Future<bool> isLoggedIn() async {
    return await _secureStorageRepository.readValue(STORAGE_KEY_TOKEN) != null;
  }

  @override
  Future<bool> authorize() async {
    Stream<String> onCode = await _server();
    final webView = new FlutterWebviewPlugin();

    Map<String, dynamic> appCredentials =
        await parseJsonFromAssets("assets/creds.json");
    String appId = appCredentials.putIfAbsent(APP_ID_KEY, () => "");
    String appSecret = appCredentials.putIfAbsent(APP_SECRET_KEY, () => "");

    final authUrl =
        "$_apiUrl$API_AUTH?client_id=$appId&redirect_uri=$REDIRECT_URI&response_type=code";

    webView.launch(authUrl);
    final String code = await onCode.first;
    final tokenUrl = _apiUrl + API_TOKEN;
    final tokenRequestBody = {
      "client_id": appId,
      "redirect_uri": REDIRECT_URI,
      "client_secret": appSecret,
      "code": code,
      "grant_type": "authorization_code"
    };
    final http.Response response =
        await http.post(tokenUrl, body: tokenRequestBody);
    webView.cleanCookies();
    webView.close();

    Map<String, dynamic> tokenParams = jsonDecode(response.body);
    await _secureStorageRepository.saveValue(
        STORAGE_KEY_TOKEN, tokenParams.putIfAbsent("access_token", () => null));
    return await isLoggedIn();
  }

  @override
  Future<bool> logout() {
    return null;
  }

  Future<Stream<String>> _server() async {
    final StreamController<String> onCode = new StreamController();
    HttpServer server =
        await HttpServer.bind(InternetAddress.loopbackIPv4, 8585, shared: true);
    server.listen((HttpRequest request) async {
      final String code = request.uri.queryParameters["code"];
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