import 'package:get/get.dart';
import 'package:starting_todo_app/progress/progress_logic.dart';


class ProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProgressController());
  }
}
