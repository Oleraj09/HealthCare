import 'package:get/get.dart';

import '../controllers/fitness_care_controller.dart';

class FitnessCareBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FitnessCareController>(
      FitnessCareController(),
    );
  }
}
