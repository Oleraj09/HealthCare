import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import 'package:health_care/app/routes/app_pages.dart';

class CreateAccountController extends GetxController {
   
  final registerFkey = GlobalKey<FormState>();

  TextEditingController? fullNameText;
  TextEditingController? emailText;
  TextEditingController? passText;
  TextEditingController? ageText;             //All textcontrollers are here with radio button for gender
  TextEditingController? heightText;
  TextEditingController? weightText;
  var radioValue = {"Male", "Female"};
  var radioGroupValue = ''.obs;

  late CollectionReference collectionReference;        //For fetching data from firebase

  @override
  void onInit() async {
    initTextField();
    collectionReference = FirebaseFirestore.instance.collection('users');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    clearTextField();
  }

  initTextField() {
    fullNameText = TextEditingController();
    emailText = TextEditingController();
    passText = TextEditingController();
    ageText = TextEditingController();           //Initialized when app opens create account screen
    heightText = TextEditingController();
    weightText = TextEditingController();
  }

  clearTextField() {
    fullNameText!.clear();
    emailText!.clear();
    passText!.clear();              //Clear textField when not needed
    ageText!.clear();
    heightText!.clear();
    weightText!.clear();
  }

  createAccount() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(                                                    //Creating account with email and pass provided in text field
              email: emailText!.text.trim(), password: passText!.text.trim())
          .whenComplete(() {
        saveAccountInfo();
        clearTextField();
        Get.offAllNamed(Routes.LOGIN);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  saveAccountInfo() async {
    

    try {
      User user = FirebaseAuth.instance.currentUser!;
      return collectionReference.doc(user.uid).set(
        {
          'full_name': fullNameText!.text,
          'email': emailText!.text.trim(),
          'gender': radioGroupValue.value,                  //This method saves all text fields value to firebase storage
                                                             //user used for creating specific user account and details
          'age': int.parse(ageText!.text),
          'height': double.parse(heightText!.text),
          'weight': double.parse(weightText!.text),
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
