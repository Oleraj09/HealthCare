import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
import 'package:get/get.dart';
 

class MedicineDiseaseInfoController extends GetxController {

  final diseaseInfoKey = GlobalKey<FormState>();
  TextEditingController? diseaseSearchNameController;
  TextEditingController? diseaseNameController;
  TextEditingController? medicineNameController;
  TextEditingController? doctorNameController;
  late CollectionReference? collectionReference;
  var dropdownValue = 1.obs;
  var dropdownItem = [1, 2, 3].obs;           // Reactive dropdown for selecting medicine time

  var foundDisease = [].obs;
  var diseaseList = <RxMap<String, dynamic>>[
    RxMap<String, dynamic>(
      { 
        'disease': "Fever",
        'cause':
            "The most common causes of fever are infections  such as colds and stomach bugs.",
        'symptoms':
            "Temperature (above 100.4°), Chills, shivering,shaking Body aches and headaches, Flushed complexion or hot skin ",
        'reference':
            "https://my.clevelandclinic.org/health/symptoms/10880 fever"
      },                                                                                                                                              //Reactive Map Function for Disease info
    ),
    RxMap<String, dynamic>(
      {
        'disease': "Common Cold",
        'cause':
            "A cold virus enters your body through your mouth, eyes or nose. The virus can spread through droplets in the air when someone who is sick coughs, sneezes or talks.",
        'symptoms':
            "Symptoms of a cold typically last for 7 to 10 daysTrusted Source. Symptoms tend to peak around day 5 and gradually improve.",
        'reference': "https://www.healthline.com/health/cold-flu/cold#symptoms"
      },
    ),
  ].obs;

  @override
  void onInit() {
 
    foundDisease.value = diseaseList;
    diseaseNameController = TextEditingController();
    diseaseSearchNameController = TextEditingController();
    medicineNameController = TextEditingController();
    doctorNameController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    clearText();
  }

  void clearText() {
    diseaseNameController!.clear();
    diseaseSearchNameController!.clear();
    doctorNameController!.clear();
    medicineNameController!.clear();
  }

  searchDisease(String diseaseName) {
    var result = [];
    if (diseaseName.isEmpty) {
      result = diseaseList;
    } else {
      result = diseaseList
          .where((name) =>
              name.toString().toLowerCase().contains(diseaseName.toLowerCase()))                 //For filtering disease name 
          .toList();
    }
    return foundDisease.value = result;
  }

  void submitMedicineReminder() {
    var user = FirebaseAuth.instance.currentUser;
    var firebase = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('medical_history');
    firebase.doc().set({                                       //For uploading user medicine and everything
      'disease': diseaseNameController!.text,
      'medicine': medicineNameController!.text,
      'doctor': doctorNameController!.text,
      'taking_time': dropdownValue.value,
    });
  }

}
