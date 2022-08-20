import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:health_care/app/data/constant.dart';
import 'package:health_care/app/data/local_%20storage/localdb.dart';

import '../../../routes/app_pages.dart';
import '../controllers/diet_control_controller.dart';

class DietControlView extends GetView<DietControlController> {
  @override
  Widget build(BuildContext context) {
    final sizedWidth = MediaQuery.of(context).size.width / 10;
    final sizedHeight = MediaQuery.of(context).size.height / 10;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: firstContainer(context)),
          Expanded(
              flex: 8,
              child: secondContainer(context, sizedWidth)),
          Expanded(
              flex: 1,
              child: thirdContainer()),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    ));
  }

  Container thirdContainer() {
    return Container(
              child: Row(children: [
                Expanded(
                  flex: 25,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.PROFILE),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Profile".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xff8dbce7),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                    flex: 1,
                    child: SizedBox(
                        // width: MediaQuery.of(context).size.width / 50,
                        )),
                Expanded(
                    flex: 25,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(Routes.SETTINGS),
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "settings".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xff8dbce7),
                          )),
                    ))
              ]),
              decoration: const BoxDecoration(color: Color(0xffbde7f0)),
            );
  }

  Container secondContainer(BuildContext context, double sizedWidth) {
    return Container(
              decoration: const BoxDecoration(color: Color(0xFFbde7f0)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Breakfast".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          imageContainer(
                              context: context,
                              title: "Dim Ruti",
                              img: "assets/images/dim_ruti.jpg"),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: "Beef Roll",
                              img: "assets/images/beef_roll.jpg"),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: "Salad",
                              img: "assets/images/salad.webp"),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: "Chicken Rice",
                              img: "assets/images/chicken_rice.png"),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: "Chicken Rice",
                              img: "assets/images/rice_veg.jpg"),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Text(
                      "Lunch".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          imageContainer(
                              context: context,
                              title: 'Dal Ruti',
                              img: 'assets/images/daal_roti.jpg'),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: "Chicken Rice",
                              img: "assets/images/chicken_rice.png"),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: "Chicken Rice",
                              img: "assets/images/rice_veg.jpg"),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: 'Bread & Fruits',
                              img: 'assets/images/bread_fruits.webp'),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: 'Meat Rice',
                              img: 'assets/images/meat_rice.webp'),
                          SizedBox(
                            width: sizedWidth,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Text(
                      "Dinner".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          imageContainer(
                              context: context,
                              title: 'Meat Rice',
                              img: 'assets/images/meat_rice.webp'),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: "Salad",
                              img: "assets/images/salad.webp"),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: "Dim Ruti",
                              img: "assets/images/dim_ruti.jpg"),
                          SizedBox(
                            width: sizedWidth,
                          ),
                          imageContainer(
                              context: context,
                              title: "Beef Roll",
                              img: "assets/images/beef_roll.jpg"),
                          SizedBox(
                            width: sizedWidth,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
  }

  Container firstContainer(BuildContext context) {
    return Container(
              decoration: const BoxDecoration(color: Color(0xFF8dbce7)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/diet.png',
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 50,
                          ),
                          Text(
                            "Diet control".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Hi, ${ConstantVariable.fullName}\nYour Total BMI is ${ConstantVariable.bmi.value.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                          Image.asset('assets/images/food_icon.png',
                              height:
                                  MediaQuery.of(context).size.height / 15),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Obx(() => FittedBox(
                                fit: BoxFit.contain,
                                child: GFProgressBar(
                                  width:
                                      MediaQuery.of(context).size.width / 2,
                                  percentage: controller.pBar.value > 1
                                      ? 1
                                      : controller.pBar.value,
                                  leading: const Text(
                                    "Water",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 23),
                                  ),
                                  progressBarColor: Colors.greenAccent,
                                  backgroundColor: const Color(0xffd9d9d9),
                                  trailing: TextButton(
                                    onLongPress: () =>
                                        controller.clearPbarWaterCount(),
                                    onPressed: () {
                                      LocalDatabase.saveWater(
                                          controller.initWater.value += 250);
                                      controller.percentageBarWater();
                                      controller.getCachedWater();
                                      controller.getCachedPbar();
                                    },
                                    child: Text(
                                      "${controller.initWater.value > controller.waterLevelCount() ? controller.waterLevelCount().toStringAsFixed(2) : controller.initWater.value} /" +
                                          controller
                                              .waterLevelCount()
                                              .toStringAsFixed(2) +
                                          " ml",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 10),
                                    ),
                                  ),
                                  lineHeight:
                                      MediaQuery.of(context).size.height / 50,
                                  progressHeadType: GFProgressHeadType.square,
                                ),
                              ))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Obx(() => FittedBox(
                              child: GFProgressBar(
                                width: MediaQuery.of(context).size.width / 2,
                                // percentage: controller.calLevel() < 1500
                                //     ? 0.2
                                //     : (controller.calLevel() <= 2200
                                //         ? 0.4
                                //         : (controller.calLevel() <= 2500
                                //             ? 0.6
                                //             : (controller.calLevel() <= 2800
                                //                 ? 0.8
                                //                 : 0.9))),
                                percentage: controller.pBar2.value > 1
                                    ? 1
                                    : controller.pBar2.value,
                                leading: const Text(
                                  "Food ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 23),
                                ),
                                progressBarColor: Colors.redAccent,
                                backgroundColor: const Color(0xffd9d9d9),
                                trailing: TextButton(
                                    onLongPress: () =>
                                        controller.clearPbarFoodCount(),
                                    onPressed: () {
                                      controller.perTimeFoods();
                                      controller.percentageBarFood();
                                      controller.getCachedFood();
                                      controller.getCachedPbar2();
                                    },
                                    // controller.calLevel().toStringAsFixed(2) +
                                    child: Text(
                                      "${controller.initFood > controller.calLevel() ? controller.calLevel().toStringAsFixed(2) : controller.initFood.value.toStringAsFixed(2)}"
                                              "/${controller.calLevel().toStringAsFixed(2)}" +
                                          " cal",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 10),
                                    )),
                                lineHeight:
                                    MediaQuery.of(context).size.height / 50,
                                progressHeadType: GFProgressHeadType.square,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }

  Container imageContainer({
    required BuildContext context,
    required String title,
    required String img,
  }) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            img,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 5,
            // height:
            //     MediaQuery.of(context).size.height /
            //         10,
          ),
          Text(title)
        ],
      ),
    );
  }
}
