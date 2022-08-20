import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final sizedBoxHeight = MediaQuery.of(context).size.height / 25;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;        //For hidding logo while keyboard appears
    return Scaffold(
      backgroundColor: const Color(0xFF8dbce7),
      body: Center(
        child: Form(
          key: controller.loginFkey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isKeyboard) loginImage(context),
                emailForm(context),
                SizedBox(
                  height: sizedBoxHeight,
                ),
                passForm(context),
                forgotPass(),
                loginButton(context),
                newAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row newAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have Account?"),
        TextButton(
            onPressed: () => Get.toNamed(Routes.CREATE_ACCOUNT),
            child: const Text("Create an Account")),
      ],
    );
  }

  GestureDetector loginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.loginFkey.currentState!.validate()) {
          if (controller.registerController.emailText!.text.isEmail) {
            controller.singIn();

            print("Success");
          } else {
            Get.snackbar("Error", "Check your email and password",
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(milliseconds: 1500));
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: const Color(0xFF1d56e8),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Row forgotPass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Forget Your Password, Reset it?"),
        TextButton(
            onPressed: () => Get.toNamed(Routes.RESET_PASS),
            child: const Text("Reset")),
      ],
    );
  }

  Container passForm(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "PASSWORD",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller.registerController.passText,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your pass";
          }
        },
      ),
    );
  }

  Container emailForm(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9), borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "ENTER EMAIL",
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        controller: controller.registerController.emailText,
        validator: (val) {
          if (val!.isEmpty) {
            return "Enter your email";
          }
        },
      ),
    );
  }

  Image loginImage(BuildContext context) {
    return Image.asset(
      'assets/images/muscle_icon.png',
      height: MediaQuery.of(context).size.height / 3,
      // width: MediaQuery.of(context).size.width / 0.5,
    );
  }
}
