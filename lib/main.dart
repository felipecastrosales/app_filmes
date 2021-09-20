import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';

import 'application/bindings/application_bindings.dart';
import 'application/ui/filmes_app_ui_config.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/movie_detail/movie_detail_module.dart';
import 'modules/splash/splash_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();
  runApp(
    // ignore: prefer_const_constructors 
    MyApp(), // it's not 'const' because void main is async 
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FilmesAppUiConfig.title,
      debugShowCheckedModeBanner: false,
      theme: FilmesAppUiConfig.theme,
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
