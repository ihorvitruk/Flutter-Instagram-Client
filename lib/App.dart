import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/AppInjector.dart';
import 'package:flutter_instagram_client/presentation/splash/SplashView.dart';

main() {
  AppInjector.inject();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashView(),
    );
  }
}
