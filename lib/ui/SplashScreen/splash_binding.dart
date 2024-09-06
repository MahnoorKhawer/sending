import 'package:get/get.dart';
import 'package:starting_todo_app/ui/SplashScreen/splash_logic.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashLogic());
  }
}
