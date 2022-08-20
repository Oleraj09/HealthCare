import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care/app/routes/app_pages.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.showExitAlert(context),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: firstContainer(context),
              ),
              Expanded(
                flex: 8,
                child: secondContainer(context),
              ),
              Expanded(
                flex: 1,
                child: thirdContainer(),
              ),
            ],
          ),
        ),
      ),
    );
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

  Container secondContainer(BuildContext context) {
    return Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Main Menu".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              menuContainer(
                                  context: context,
                                  title: "Diet Recommandation",
                                  img: 'assets/images/diet.png',
                                  route: Routes.DIET_CONTROL),
                              menuContainer(
                                  context: context,
                                  title: "Fitness Care Exercise",
                                  img: 'assets/images/fitness_care.png',
                                  route: Routes.FITNESS_CARE),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              menuContainer(
                                  context: context,
                                  title: "Disease & Medicine Info",
                                  img: 'assets/images/drugs.png',
                                  route: Routes.MEDICINE_DISEASE_INFO),
                              menuContainer(
                                  context: context,
                                  title: "Features Upcoming",
                                  img: 'assets/images/coming-soon.png',
                                  route: Routes.COMING_SOON),
                            ],
                          ),
                        )
                      ]),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xffbde7f0),
                ),
              );
  }

  Container firstContainer(BuildContext context) {
    return Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/healthcare.png',
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 35,
                            ),
                            Text(
                              "Welcome to Health Care".toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                const      Expanded(
                        flex: 2,
                        child:   Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            "To ensure good health, eat lightly, breath deeply, live moderately, cultivate cheerfuliness and maintain an interest in life",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                decoration: const BoxDecoration(color: Color(0xff8dbce7)),
              );
  }

  GestureDetector menuContainer(
      {required BuildContext context,
      required var route,
      required var img,
      required var title}) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    img,
                    // height: MediaQuery.of(context)
                    //         .size
                    //         .height /
                    //     5,
                    // width: MediaQuery.of(context)
                    //         .size
                    //         .width /
                    //     1.8,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height / 4.5,
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: const BoxDecoration(
              color: Color(0xffd9d9d9),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)))),
    );
  }
}
