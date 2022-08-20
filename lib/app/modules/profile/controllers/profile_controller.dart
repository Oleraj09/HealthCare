import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_care/app/modules/create_account/controllers/create_account_controller.dart';
import 'package:health_care/app/modules/welcome/controllers/welcome_controller.dart';

import '../../../data/constant.dart';
import '../../../data/local_ storage/localdb.dart';

class ProfileController extends GetxController {
  final profileKey = GlobalKey<FormState>();
  final welcomeController = Get.put(WelcomeController());
  final createAcc = Get.put(CreateAccountController());
  late CollectionReference collectionReference;
  @override
  void onInit() {
    collectionReference = FirebaseFirestore.instance.collection('users');
    //welcomeController.getUserData();
    valueAssingment();
    getMedicalHistory();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<QuerySnapshot> getMedicalHistory() {
    var user = FirebaseAuth.instance.currentUser;
    var medicalHistory = FirebaseFirestore.instance                         //Getting user medicine data from cloud firebase
        .collection('users')
        .doc(user!.uid)
        .collection('medical_history')
        .get();
    return medicalHistory;
  }

  updateInfo() {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var updateData = collectionReference.doc(user!.uid).update({
        'full_name': createAcc.fullNameText!.text,
        'gender': createAcc.radioGroupValue.value,
        'age': int.parse(createAcc.ageText!.text),
        'height': double.parse(createAcc.heightText!.text),
        'weight': double.parse(createAcc.weightText!.text),
      }).whenComplete(() async {
        User? user = FirebaseAuth.instance.currentUser;
        var fetchedInfo = await FirebaseFirestore.instance                          //Fetching user specific data from firebase
            .collection('users')
            .doc(user!.uid)
            .get();
        LocalDatabase.saveFullName(fetchedInfo.data()!['full_name']);
        LocalDatabase.saveEmail(fetchedInfo.data()!['email']);
        LocalDatabase.saveGender(fetchedInfo.data()!['gender']);
        LocalDatabase.saveAge(fetchedInfo.data()!['age']);
        LocalDatabase.saveHeight(fetchedInfo.data()!['height']);
        LocalDatabase.saveWeight(fetchedInfo.data()!['weight']);

        ConstantVariable.fullName.value =
            await LocalDatabase.getName() ?? 'Loading...';
        ConstantVariable.emailAddress.value =
            await LocalDatabase.getEmail() ?? 'Loading...';                                     //Storing cached data in constant variable
        ConstantVariable.gender.value =
            await LocalDatabase.getGender() ?? 'Loading...';
        ConstantVariable.age.value = await LocalDatabase.getAge() ?? 0;
        ConstantVariable.height.value = await LocalDatabase.getHeight() ?? 0.0;
        ConstantVariable.weight.value = await LocalDatabase.getWeight() ?? 0.0;
        ConstantVariable.bmi.value = (ConstantVariable.weight.value /
            pow(ConstantVariable.height.value * 0.3048, 2));
      });
      return updateData;
    } catch (e) {
      print(e);
    }
  }

  void valueAssingment() {
    createAcc.fullNameText!.text = ConstantVariable.fullName.value;
    // createAcc.emailText!.text = ConstantVariable.emailAddress.value;
    createAcc.ageText!.text = ConstantVariable.age.value.toString();
    createAcc.heightText!.text = ConstantVariable.height.value.toString();         //Assigning cached data to text field
    createAcc.weightText!.text = ConstantVariable.weight.value.toString();
    createAcc.radioGroupValue.value = ConstantVariable.gender.value.toString();
  }
}
