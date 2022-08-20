import 'package:get/get.dart';

import '../controllers/medicine_disease_info_controller.dart';

class MedicineDiseaseInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MedicineDiseaseInfoController>(
      MedicineDiseaseInfoController(),
    );
  }
}
