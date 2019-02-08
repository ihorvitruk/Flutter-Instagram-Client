import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_telegram_client/data/NetworkRepositoryImpl.dart';
import 'package:flutter_telegram_client/domain/NetworkRepository.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPageView.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPagePresenter.dart';

void main() {
  inject();
  runApp(MyApp());
}

void inject() {
  var injector = Injector.getInjector();
  //repositories
  injector.map<NetworkRepository>((i) => NetworkRepositoryImpl(),
      isSingleton: true);
  //presenters
  injector.map<SplashPagePresenter>(
      (i) => SplashPagePresenter(i.get<NetworkRepository>()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashPage(),
    );
  }
}
