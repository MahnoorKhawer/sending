import 'package:get/get.dart';

import 'LogoutLogic.dart';


class Logoutbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogoutController());
  }
}
