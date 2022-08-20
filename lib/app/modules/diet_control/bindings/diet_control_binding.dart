import 'package:get/get.dart';

import '../controllers/diet_control_controller.dart';

class DietControlBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DietControlController>(
      DietControlController(),
    );
  }
}
