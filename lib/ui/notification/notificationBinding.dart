import 'package:get/get.dart';
import 'package:starting_todo_app/ui/notification/notificationLogic.dart';


class Notificationbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Notificationlogic());
  }
}
