import 'package:get/get.dart';

import 'package:app_filmes/application/modules/module.dart';
import 'splash_bindings.dart';
import 'splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}
