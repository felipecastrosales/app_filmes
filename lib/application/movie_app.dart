import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app_filmes/modules/home/home_module.dart';
import 'package:app_filmes/modules/login/login_module.dart';
import 'package:app_filmes/modules/movie_detail/movie_detail_module.dart';
import 'package:app_filmes/modules/splash/splash_module.dart';

import 'bindings/application_bindings.dart';
import 'ui/filmes_app_ui_config.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});
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
