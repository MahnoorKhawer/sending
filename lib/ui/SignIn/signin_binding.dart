import 'package:get/get.dart';
import 'package:starting_todo_app/ui/SignIn/signin_logic.dart';
import 'package:starting_todo_app/ui/SignIn/signin_view.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
