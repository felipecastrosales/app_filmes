import 'package:get/get.dart';

import 'package:app_filmes/application/modules/module.dart';
import 'movie_detail_bindings.dart';
import 'movie_detail_page.dart';

class MovieDetailModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => const MovieDetailPage(),
      binding: MovieDetailBindings(),
    ),
  ];
}
