import 'package:get/get.dart';

import 'package:app_filmes/services/login/login_service.dart';
import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(
        MessageModel.info(
          title: 'Success',
          message: 'Login with Success',
        ),
      );
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      MessageModel.error(
        title: 'Error',
        message: 'Login with Error',
      );
    }
  }
}
