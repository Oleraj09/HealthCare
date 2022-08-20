import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care/app/data/constant.dart';
import 'package:health_care/app/routes/app_pages.dart';
import 'package:health_care/app/views/views/alert_dialog_view.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    double hourInterval = 13 / controller.dietController.glassCounter();
    final medicineController = controller.medicieDiseaseController;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xffbde7f0),
        body: ListView(children: [
          ListTile(
            tileColor: Colors.white,
            title: const Center(
                child: Text(
              "LOG OUT",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            )),
            trailing: IconButton(
                onPressed: () => Get.defaultDialog(
                    title: '',
                    middleText: "Are you sure?",
                    middleTextStyle: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 25),
                    confirm: TextButton(
                        onPressed: () => controller.signOut(),
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        )),
                    cancel: TextButton(
                        onPressed: () => Get.back(),
                        child: const Text(
                          "No",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ))),
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 15.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Center(
              child: Text(
            "Medicine Alarm".toUpperCase(),
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
          )),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: morningAlarm(context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 70,
                        ),
                        Expanded(
                          child: noonAlarm(context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 70,
                        ),
                        Expanded(
                          child: nightAlarm(context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                      ],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff8dbce7)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          Center(
              child: Text(
            "Water Alarm".toUpperCase(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          )),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Center(
                          child: Text(
                            " SET ${controller.dietController.glassCounter().floor().toString()} Alarm With ${hourInterval.toStringAsFixed(2)} Hour Interval",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                backgroundColor: Color(0xff1d56e8)),
                          ),
                        )),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: waterAlarmOne(
                                      context: context, counter: "1")),
                              Expanded(
                                  child: waterAlarmTwo(
                                      context: context, counter: "2")),
                              Expanded(
                                  child: waterAlarmThree(
                                      context: context, counter: "3")),
                              Expanded(
                                  child: waterAlarmFour(
                                      context: context, counter: "4")),
                              Expanded(
                                  child: waterAlarmFive(
                                      context: context, counter: "5")),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: waterAlarmSix(
                                      context: context, counter: "6")),
                              Expanded(
                                  child: waterAlarmSeven(
                                      context: context, counter: "7")),
                              Expanded(
                                  child: waterAlarmEight(
                                      context: context, counter: "8")),
                              Expanded(
                                  child: waterAlarmNine(
                                      context: context, counter: "9")),
                              Expanded(
                                  child: waterAlarmTen(
                                      context: context, counter: "10")),
                            ],
                          ),
                        ),
                     
                      ],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff8dbce7)),
                ),
              ),
            ),
          ),
          Center(child: cancelAllAlarm(context))
        ]));
  }

  Padding waterAlarmOne({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("1st Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationOne(
                  id: ConstantVariable.age.value + 40,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  //  payload: "Routes.WELCOME",
                  body: "Time For 1st Water");
            });
          },
          child: Text(counter!)),
    );
  }

  Padding waterAlarmTwo({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("2nd Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationTwo(
                  id: ConstantVariable.age.value + 50,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  //    payload: "Routes.WELCOME",
                  body: "Time For 2nd Water");
            });
          },
          child: Text(counter!)),
    );
  }

  Padding waterAlarmThree({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("3rd Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationThree(
                  id: ConstantVariable.age.value + 60,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  // payload: "Routes.WELCOME",
                  body: "Time For 3rd Water");
            });
          },
          child: Text(counter!)),
    );
  }

  Padding waterAlarmFour({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("4th Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationNight(
                  id: ConstantVariable.age.value + 70,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  //  payload: "Routes.WELCOME",
                  body: "Time For 4th Water");
            });
          },
          child: Text(counter!)),
    );
  }

  Padding waterAlarmFive({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("5th Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationFive(
                  id: ConstantVariable.age.value + 80,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  payload: "Routes.WELCOME",
                  body: "Time For 5th Water");
            });
          },
          child: Text(counter!)),
    );
  }

  Padding waterAlarmSix({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("6th Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationSix(
                  id: ConstantVariable.age.value + 130,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  payload: "Routes.WELCOME",
                  body: "Time For 6th Water");
            });
          },
          child: Text(counter!)),
    );
  }

  Padding waterAlarmSeven({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("7th Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationSeven(
                  id: ConstantVariable.age.value + 120,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  payload: "Routes.WELCOME",
                  body: "Time For 7th Water");
            });
          },
          child: Text(counter!)),
    );
  }

  Padding waterAlarmEight({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("8th Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationEight(
                  id: ConstantVariable.age.value + 110,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  payload: "Routes.WELCOME",
                  body: "Time For 8th Water");
            });
          },
          child: Text(counter!)),
    );
  }

  Padding waterAlarmNine({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("9th Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationNine(
                  id: ConstantVariable.age.value + 100,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  payload: "Routes.WELCOME",
                  body: "Time For 9th Water");
            });
          },
          child: Text(counter!)),
    );
  }

  Padding waterAlarmTen({
    required BuildContext context,
    required String? counter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 25),
              primary: const Color(0xff1d56e8)),
          onPressed: () {
            controller.showPicker(context).whenComplete(() {
              Get.snackbar("10th Water Alarm", "Picked Sucessfully",
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM);
              controller.showScheduledNotificationTen(
                  id: ConstantVariable.age.value + 90,
                  title: "It's ${controller.timeHour}:${controller.timeMinute}",
                  //  payload: "Routes.WELCOME",
                  body: "Time For 10th Water");
            });
          },
          child: Text(counter!)),
    );
  }

  ElevatedButton cancelAllAlarm(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fixedSize: Size(MediaQuery.of(context).size.width / 2,
                MediaQuery.of(context).size.height / 15),
            primary: const Color(0xff1d56e8)),
        onPressed: () => controller.cancelAllNotification(),
        child: Text(
          "Cancel All".toUpperCase(),
        ));
  }

  Row nightAlarm(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width / 2,
                    MediaQuery.of(context).size.height / 15),
                primary: const Color(0xff1d56e8)),
            onPressed: () {
              controller.showPicker(context).whenComplete(() {
                Get.snackbar("Night Alarm", "Picked Sucessfully",
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                    snackPosition: SnackPosition.BOTTOM);
                controller.showScheduledNotificationNight(
                    id: ConstantVariable.age.value + 10,
                    title:
                        "It's ${controller.timeHour}:${controller.timeMinute}",
                    payload: "Routes.WELCOME",
                    body: "Time For Night Medicines");
              });
            },
            icon: const Icon(Icons.alarm),
            label: const Text("Night Alarm")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: const Color(0xff1d56e8)),
            onPressed: () => controller.cancelNotification(
                "Night Alarm", ConstantVariable.age.value + 10),
            child: const Icon(Icons.cancel))
      ],
    );
  }

  Row noonAlarm(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width / 2,
                    MediaQuery.of(context).size.height / 15),
                primary: const Color(0xff1d56e8)),
            onPressed: () {
              controller.showPicker(context).whenComplete(() {
                Get.snackbar("Noon Alarm", "Picked Sucessfully",
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                    snackPosition: SnackPosition.BOTTOM);
                controller.showScheduledNotificationNoon(
                    id: ConstantVariable.age.value + 20,
                    title:
                        "It's ${controller.timeHour}:${controller.timeMinute}",
                    body: "Time For Noon Medicines");
              });
            },
            icon: const Icon(Icons.alarm),
            label: const Text("Noon Alarm")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: const Color(0xff1d56e8)),
            onPressed: () => controller.cancelNotification(
                "Noon Alarm", ConstantVariable.age.value + 20),
            child: const Icon(Icons.cancel))
      ],
    );
  }

  Row morningAlarm(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width / 2,
                    MediaQuery.of(context).size.height / 15),
                primary: const Color(0xff1d56e8)),
            onPressed: () {
              controller.showPicker(context).whenComplete(() {
                Get.snackbar("Morning Alarm", "Picked Sucessfully",
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                    snackPosition: SnackPosition.BOTTOM);

                controller.showScheduledNotificationMorning(
                    id: ConstantVariable.age.value + 30,
                    title:
                        "It's ${controller.timeHour}:${controller.timeMinute}",
                    payload: "Routes.WELCOME",
                    body: "Time For Morning Medicines");
              });
            },
            icon: const Icon(Icons.alarm),
            label: const Text("Morning Alarm")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: const Color(0xff1d56e8)),
            onPressed: () => controller.cancelNotification(
                "Morning Alarm", ConstantVariable.age.value + 30),
            child: const Icon(Icons.cancel))
      ],
    );
  }
}
