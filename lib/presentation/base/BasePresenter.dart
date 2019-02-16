import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/presentation/base/BaseViewCallback.dart';

abstract class BasePresenter<V extends BaseViewCallback> {
  V view;

  StreamSubscription<ConnectivityResult> connectivitySubscription;

  @mustCallSuper
  init() {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      onConnectionChanged(isConnection(result));
    });
  }

  @mustCallSuper
  dispose() {
    connectivitySubscription.cancel();
    view = null;
  }

  onConnectionChanged(bool isConnection) {}

  @protected
  isConnection(ConnectivityResult connectivityResult) {
    return connectivityResult != ConnectivityResult.none;
  }
}
