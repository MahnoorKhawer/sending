import 'package:get/get.dart';

import 'onboarding_logic.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingLogic());
  }
}
