import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
