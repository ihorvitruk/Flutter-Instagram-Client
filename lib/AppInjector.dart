import 'package:flutter_instagram_client/data/AuthRepositoryImpl.dart';
import 'package:flutter_instagram_client/data/NetworkRepositoryImpl.dart';
import 'package:flutter_instagram_client/domain/repository/AuthRepository.dart';
import 'package:flutter_instagram_client/domain/repository/NetworkRepository.dart';
import 'package:flutter_instagram_client/presentation/chats/ChatsPresenter.dart';
import 'package:flutter_instagram_client/presentation/checkcode/CheckCodePresenter.dart';
import 'package:flutter_instagram_client/presentation/contacts/ContactsPresenter.dart';
import 'package:flutter_instagram_client/presentation/home/HomePresenter.dart';
import 'package:flutter_instagram_client/presentation/login/LoginPresenter.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfilePresenter.dart';
import 'package:flutter_instagram_client/presentation/splash/SplashPresenter.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class AppInjector {
  static const String API_URL_KEY = "api_url";

  static inject() {
    var injector = Injector.getInjector();

    //strings
    injector.map<String>((i) => "https://api.instagram.com", key: API_URL_KEY);

    //repositories
    injector.map<NetworkRepository>((i) => NetworkRepositoryImpl(),
        isSingleton: true);
    injector.map<AuthRepository>(
        (i) => AuthRepositoryImpl(i.get(key: API_URL_KEY)),
        isSingleton: true);

    //presenters
    injector.map<SplashPresenter>((i) => SplashPresenter(i.get(), i.get()));
    injector.map<HomePresenter>((i) => HomePresenter());
    injector.map<ContactsPresenter>((i) => ContactsPresenter());
    injector.map<ChatsPresenter>((i) => ChatsPresenter());
    injector.map<ProfilePresenter>((i) => ProfilePresenter());
    injector.map<CheckCodePresenter>((i) => CheckCodePresenter());
    injector.map<LoginPresenter>((i) => LoginPresenter(i.get()));
  }
}
