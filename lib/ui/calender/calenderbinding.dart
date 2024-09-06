import 'package:get/get.dart';
import 'package:starting_todo_app/ui/calender/calenderlogic.dart';

class CalenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CalendarController(),
      permanent: true,
    );
    Get.lazyPut<CalendarController>(
          () => CalendarController(),
    );
  }
}
