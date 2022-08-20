import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  @override
  Widget build(BuildContext context) {
    final heightBox = MediaQuery.of(context).size.height / 35;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: const Color(0xff8dbce7),
      body: SafeArea(
        child: Center(
          child: Form(
            key: controller.registerFkey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  fullNameForm(
                      context: context, controller: controller.fullNameText!),
                  SizedBox(
                    height: heightBox,
                  ),
                  emailForm(
                      context: context, controller: controller.emailText!),
                  Obx(() => radioButton()),
                  ageForm(context: context, controller: controller.ageText!),
                  SizedBox(
                    height: heightBox,
                  ),
                  heightForm(
                      context: context, controller: controller.heightText!),
                  SizedBox(
                    height: heightBox,
                  ),
                  weightForm(
                      context: context, controller: controller.weightText!),
                  SizedBox(
                    height: heightBox,
                  ),
                  passForm(context: context, controller: controller.passText!),
                  SizedBox(
                    height: heightBox,
                  ),
                  if (!isKeyboard) registerButton(context)
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector registerButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.registerFkey.currentState!.validate()) {
          if (controller.emailText!.text.isEmail) {
            controller.createAccount();

            print(
                "${controller.fullNameText!.text}\n${controller.emailText!.text}\n${controller.ageText!.text}\n${controller.heightText!.text}\n${controller.weightText!.text}\n${controller.passText!.text}\n ${controller.radioGroupValue.value}");
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
          "REGISTER",
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

  Container passForm(
      {required BuildContext context,
      required TextEditingController controller}) {
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
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your pass";
          }
        },
      ),
    );
  }

  Container weightForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "WEIGHT",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your weight";
          }
        },
      ),
    );
  }

  Container heightForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "HEIGHT",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your height";
          }
        },
      ),
    );
  }

  Container ageForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "AGE",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your age";
          }
        },
      ),
    );
  }

  Row radioButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Text("GENDER: "),
        Row(
          children: [
            Radio(
                value: "Male",
                groupValue: controller.radioGroupValue.value,
                onChanged: (value) {
                  controller.radioGroupValue.value = value.toString();
                }),
            const Text("Male"),
          ],
        ),
        Row(children: [
          Radio(
            value: "Female",
            groupValue: controller.radioGroupValue.value,
            onChanged: (value) {
              controller.radioGroupValue.value = value.toString();
            },
          ),
         const Text("Female"),
        ]),
      ],
    );
  }

  Container emailForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "ENTER EMAIL",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your email";
          }
        },
      ),
    );
  }

  Container fullNameForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "FULL NAME",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your full name";
          }
        },
      ),
    );
  }
}
