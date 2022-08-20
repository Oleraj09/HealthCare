import 'package:get/get.dart';

class ConstantVariable {
  static RxString fullName = ''.obs;
  static RxString emailAddress = ''.obs;
  static RxInt age = 0.obs;
  static RxDouble weight = 0.0.obs;
  static RxDouble height = 0.0.obs;                        //All constant varibale are here for storing data from device storage
  static RxString gender = ''.obs;
  static RxDouble bmi = 0.0.obs;
  // static RxBool isLoggedin = false.obs;
}
