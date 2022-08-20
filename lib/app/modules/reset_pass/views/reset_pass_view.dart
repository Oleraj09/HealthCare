import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care/app/routes/app_pages.dart';

import '../controllers/reset_pass_controller.dart';

class ResetPassView extends GetView<ResetPassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8dbce7),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Text(
              "Enter Your Valid Email",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Form(
            key: controller.resetFormKey,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(15)),
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Email".toUpperCase(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),
                controller: controller.resetEmailController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your email";
                  } 
                },
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width / 2,
                      MediaQuery.of(context).size.height / 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: const Color(0xff1d56e8)),
              onPressed: () {
                if (controller.resetFormKey.currentState!.validate()) {
                  controller
                      .resetPassword()
                       ;
                }
              },
              child: Text("Reset Password".toUpperCase()))
        ],
      )),
    );
  }
}
