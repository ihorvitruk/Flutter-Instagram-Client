import 'package:flutter_instagram_client/data/repository/AuthRepositoryImpl.dart';
import 'package:flutter_instagram_client/data/repository/ContentRepositoryImpl.dart';
import 'package:flutter_instagram_client/data/repository/NetworkRepositoryImpl.dart';
import 'package:flutter_instagram_client/data/repository/SecureStorageRepositoryImpl.dart';
import 'package:flutter_instagram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_instagram_client/domain/repository/ContentRepository.dart';
import 'package:flutter_instagram_client/domain/repository/NetworkRepository.dart';
import 'package:flutter_instagram_client/domain/repository/SecureStorageRepository.dart';
import 'package:flutter_instagram_client/presentation/chats/ChatsPresenter.dart';
import 'package:flutter_instagram_client/presentation/contacts/ContactsPresenter.dart';
import 'package:flutter_instagram_client/presentation/home/HomePresenter.dart';
import 'package:flutter_instagram_client/presentation/login/LoginPresenter.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfilePresenter.dart';
import 'package:flutter_instagram_client/presentation/splash/SplashPresenter.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class AppInjector {
  static const String HOST_URL_KEY = "host_url";

  static inject() {
    final injector = Injector.getInjector();

    //strings
    injector.map<String>((i) => "api.instagram.com", key: HOST_URL_KEY);

    //repositories
    injector.map<NetworkRepository>((i) => NetworkRepositoryImpl(),
        isSingleton: true);
    injector.map<SecureStorageRepository>((i) => SecureStorageRepositoryImpl());
    injector.map<AuthRepository>(
        (i) => AuthRepositoryImpl(i.get(key: HOST_URL_KEY), i.get()),
        isSingleton: true);
    injector.map<ContentRepository>(
        (i) => ContentRepositoryImpl(i.get(key: HOST_URL_KEY), i.get()));

    //presenters
    injector.map<SplashPresenter>((i) => SplashPresenter(i.get(), i.get()));
    injector.map<HomePresenter>((i) => HomePresenter());
    injector.map<ContactsPresenter>((i) => ContactsPresenter());
    injector.map<ChatsPresenter>((i) => ChatsPresenter());
    injector.map<ProfilePresenter>((i) => ProfilePresenter(i.get(), i.get()));
    injector.map<LoginPresenter>((i) => LoginPresenter(i.get()));
  }
}
