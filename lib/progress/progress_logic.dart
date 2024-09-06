import 'package:get/get.dart';

class ProgressController extends GetxController {
  var percent = 0.66.obs;

  void updateProgress(double newPercent) {
    percent.value = newPercent;
  }
}
