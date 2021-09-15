import 'package:get/get.dart';

import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    loading(true);
    await 2.seconds.delay();
    loading(false);
    message(
      MessageModel.error(
        title: 'Title Error',
        message: 'Message Error',
      ),
    );
    await 1.seconds.delay();
    message(
      MessageModel.info(
        title: 'Title Info',
        message: 'Message Info',
      ),
    );
  }
}
