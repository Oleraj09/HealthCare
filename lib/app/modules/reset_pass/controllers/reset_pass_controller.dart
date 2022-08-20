import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/app/routes/app_pages.dart';

class ResetPassController extends GetxController {
   
  TextEditingController? resetEmailController;
  var resetFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    resetEmailController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<FirebaseAuth> resetPassword() async {
    var _auth = FirebaseAuth.instance;
    await _auth                                                                 
        .sendPasswordResetEmail(email: resetEmailController!.text.trim())              //Resting user password by sending email 
        .whenComplete(() {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar("Email Sent", "Check Spam Box",
          backgroundColor: Colors.black, colorText: Colors.white);
    }).catchError((e) => print(e));
    return _auth;
  }
}
