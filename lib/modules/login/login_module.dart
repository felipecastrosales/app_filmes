import 'package:get/get.dart';

import 'package:app_filmes/application/modules/module.dart';
import 'login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
    )
  ];
}
