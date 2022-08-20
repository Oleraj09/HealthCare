import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/app/data/constant.dart';
import 'package:health_care/app/data/local_%20storage/localdb.dart';
import 'package:health_care/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietControlController extends GetxController {
  var initWater = 0.obs;
  var initFood = 0.obs;
  var pBar = 0.0.obs;
  var pBar2 = 0.0.obs;
  var waterCount = (ConstantVariable.weight.value * 0.033).obs;
  var waterPercentage = 0.0.obs;
  var foodPercentage = 0.0.obs;

  var calCount = 0.obs;
  @override
  void onInit() {
    getCachedWater();
    getCachedPbar();
    waterLevelCount();
    getCachedFood();
    getCachedPbar2();
    calLevel();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  double waterLevelCount() {
    var waterLevel = waterCount.value * 1000;
    // Counts level of water =  weight * 0.033
    return waterLevel;
  }

  percentageBarWater() {
    var glassToPercentage = (1 / glassCounter());
    LocalDatabase.savePBar(waterPercentage.value +=
        glassToPercentage); //Water percentage bar with sharedpreference
    return waterPercentage;
  }

  percentageBarFood() {
    var foodToPercentage = 1 / 3;
    LocalDatabase.savePBar2(foodPercentage.value +=
        foodToPercentage); //Food percentage bar with sharedpreference(3 times a day)
    print(foodPercentage.value);
    return foodToPercentage;
  }

  double glassCounter() {
    var glassCount = (waterCount.value / 0.25); //Total number of glass
    return glassCount;
  }

  Future<int> getCachedWater() async {
    await LocalDatabase.getWater().then((value) => initWater.value = value ??
        0); //Initial water value(starts from 0 - how much a user needs)
    return initWater.value;
  }

  Future<double> getCachedPbar() async {
    await LocalDatabase.getPbar().then(
        (value) => pBar.value = value ?? 0.0); // Getting cached Progress bar

    return pBar.value;
  }

  int perTimeFoods() {
    var counterFood = calCount.value ~/ 3;
    LocalDatabase.saveFood(
        initFood.value += counterFood); //Adding value of calories divided by 3
    print("Per:${initFood.value += counterFood}");
    return counterFood;
  }

  Future<int> getCachedFood() async {
    await LocalDatabase.getFood()
        .then((value) => initFood.value = value ?? 0); // Getting cached Food value
    return initFood.value;
  }

  Future<double> getCachedPbar2() async {
    await LocalDatabase.getPbar2().then((value) => pBar2.value = value ?? 0.0);        // Getting cached Food progress bar

    return pBar2.value;
  }

  int calLevel() {
    if (ConstantVariable.gender.value == 'Male') {
      if (ConstantVariable.age.value > 51) {
        return calCount.value = 2400;
      } else if (ConstantVariable.age.value >= 31) {
        return calCount.value = 2600;
      } else if (ConstantVariable.age.value >= 19) {
        return calCount.value = 2800;                     
      } else if (ConstantVariable.age.value >= 14) {
        return calCount.value = 2800;
      } else {
        return calCount.value = 2000;
      }                                                                                         //Getting Calories depending on user age
    } else {
      if (ConstantVariable.age.value > 51) {
        return calCount.value = 1800;
      } else if (ConstantVariable.age.value >= 31) {
        return calCount.value = 2000;
      } else if (ConstantVariable.age.value >= 19) {
        return calCount.value = 2200;
      } else if (ConstantVariable.age.value >= 14) {
        return calCount.value = 2000;
      } else {
        return calCount.value = 1700;
      }
    }
  }

  clearPbarWaterCount() async {
    LocalDatabase.saveWater(0);
    LocalDatabase.savePBar(0.0);
    Get.offAllNamed(Routes.WELCOME);
    Get.snackbar("Progress cleared", "Reopen page to start again",            
        backgroundColor: Colors.white, colorText: Colors.black);
  }                                               
                                                                            //For clearing progress bar

  clearPbarFoodCount() async {
    LocalDatabase.saveFood(0);
    LocalDatabase.savePBar2(0.0);
    Get.offAllNamed(Routes.WELCOME);
    Get.snackbar("Progress cleared", "Reopen page to start again",
        backgroundColor: Colors.white, colorText: Colors.black);
  }
}
