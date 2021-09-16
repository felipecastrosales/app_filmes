import 'package:get/get.dart';

import 'package:app_filmes/services/login/login_service.dart';

class HomeController extends GetxController {
  // ignore: constant_identifier_names
  static const NAVIGATOR_KEY = 1;
  // ignore: constant_identifier_names
  static const INDEX_PAGE_EXIT = 2;

  final LoginService _loginService;
  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  final _pages = [
    '/movies',
    '/favorites',
  ];

  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(
        _pages[page],
        id: NAVIGATOR_KEY,
      );
    }
  }
}
