import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_telegram_client/data/AuthRepositoryImpl.dart';
import 'package:flutter_telegram_client/data/NetworkRepositoryImpl.dart';
import 'package:flutter_telegram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_telegram_client/domain/repository/NetworkRepository.dart';
import 'package:flutter_telegram_client/presentation/chats/ChatsPresenter.dart';
import 'package:flutter_telegram_client/presentation/checkcode/CheckCodePresenter.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsPresenter.dart';
import 'package:flutter_telegram_client/presentation/home/HomePresenter.dart';
import 'package:flutter_telegram_client/presentation/login/LoginPresenter.dart';
import 'package:flutter_telegram_client/presentation/profile/ProfilePresenter.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashPresenter.dart';
import 'package:flutter_telegram_client/presentation/splash/SplashView.dart';

main() {
  inject();
  runApp(MyApp());
}

inject() {
  var injector = Injector.getInjector();

  //repositories
  injector.map<NetworkRepository>((i) => NetworkRepositoryImpl(),
      isSingleton: true);
  injector.map<AuthRepository>((i) => AuthRepositoryImpl(), isSingleton: true);

  //presenters
  injector
      .map<SplashPresenter>((i) => SplashPresenter(i.get(), i.get()));
  injector.map<HomePresenter>((i) => HomePresenter());
  injector.map<ContactsPresenter>((i) => ContactsPresenter());
  injector.map<ChatsPresenter>((i) => ChatsPresenter());
  injector.map<ProfilePresenter>((i) => ProfilePresenter());
  injector.map<CheckCodePresenter>((i) => CheckCodePresenter());
  injector.map<LoginPresenter>((i) => LoginPresenter());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashWidget(),
    );
  }
}
