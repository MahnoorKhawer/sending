import 'package:get/get.dart';


import 'home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
      permanent: true,
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}
