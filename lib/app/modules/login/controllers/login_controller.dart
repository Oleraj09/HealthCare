import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_care/app/data/local_%20storage/localdb.dart';
import 'package:health_care/app/modules/create_account/controllers/create_account_controller.dart';
import 'package:health_care/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final loginFkey = GlobalKey<FormState>();                                            //Key for form validation
  final registerController = Get.put(CreateAccountController());

  @override
  void onInit() {
    registerController.emailText = TextEditingController();
    registerController.passText = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    registerController.emailText!.clear();
    registerController.passText!.clear();
  }

  void singIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: registerController.emailText!.text.trim(),                        //Logging in user with user mail and pass 
              password: registerController.passText!.text)
          .whenComplete(() {
        LocalDatabase.saveLoginData(true);
        var user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Get.offAllNamed(Routes.WELCOME);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'No user ',
          'User not found for that email.',
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Password Wrong', 'Wrong password provided for that user.',
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    }
  }
}
