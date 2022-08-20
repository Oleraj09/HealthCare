import 'dart:async';

import 'package:get/get.dart';
import 'package:health_care/app/data/local_%20storage/localdb.dart';
import 'package:health_care/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
   pageRedirect();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void pageRedirect() {
     Timer(
        const Duration(seconds: 2), () async =>await LocalDatabase.getLoginData().then((logInValue) {
      Get.offAllNamed(logInValue==true? Routes.WELCOME:Routes.LOGIN);
    }));
  }
}
