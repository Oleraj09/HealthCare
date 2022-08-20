import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/app/data/constant.dart';
import 'package:health_care/app/data/local_%20storage/localdb.dart';

class WelcomeController extends GetxController {
  

  @override
  void onInit() {
    super.onInit();
    getUserData();

    // retriveDataFromCache();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> showExitAlert(BuildContext context) async {
    final value = await Get.defaultDialog(
        title: '',
        middleText: "Are you wanna exit?",
        // middleText: '',
        cancel: TextButton(
          onPressed: () => Navigator.of(context).pop(false),                         //showing Exit button when user tries to exit in welcome screen
          child: const Text("NO"),
        ),
        confirm: TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("YES")));

    return value == true;
  }

 

  void getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var fetchedInfo = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    LocalDatabase.saveFullName(fetchedInfo.data()!['full_name']);
    LocalDatabase.saveEmail(fetchedInfo.data()!['email']);
    LocalDatabase.saveGender(fetchedInfo.data()!['gender']);
    LocalDatabase.saveAge(fetchedInfo.data()!['age']);
    LocalDatabase.saveHeight(fetchedInfo.data()!['height']);
    LocalDatabase.saveWeight(fetchedInfo.data()!['weight']);
                                                                                               // Getting user specific data
    ConstantVariable.fullName.value =
        await LocalDatabase.getName() ?? 'Loading...';
    ConstantVariable.emailAddress.value =
        await LocalDatabase.getEmail() ?? 'Loading...';
    ConstantVariable.gender.value =
        await LocalDatabase.getGender() ?? 'Loading...';
    ConstantVariable.age.value = await LocalDatabase.getAge() ?? 0;
    ConstantVariable.height.value = await LocalDatabase.getHeight() ?? 0.0;
    ConstantVariable.weight.value = await LocalDatabase.getWeight() ?? 0.0;
    ConstantVariable.bmi.value = (ConstantVariable.weight.value /
        pow(ConstantVariable.height.value * 0.3048, 2));

    final bmi = ConstantVariable.bmi.value;
    Get.snackbar('Welcome ${ConstantVariable.fullName.value}',                         //Showing BMI status depending on weight
        'Your BMI Status:${bmi <= 18.4 ? 'Underweight' : (bmi <= 24.9 ? "Normal" : (bmi <= 39.9 ? "Overweight" : "Obese"))}',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        colorText: Colors.black,
        backgroundColor: Colors.white);
  }
}
