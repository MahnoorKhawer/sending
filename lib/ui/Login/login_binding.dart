import 'package:get/get.dart';
import 'package:starting_todo_app/ui/SignIn/signin_logic.dart';
import 'package:starting_todo_app/ui/SignIn/signin_view.dart';

import 'login_logic.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginInController());
  }
}
