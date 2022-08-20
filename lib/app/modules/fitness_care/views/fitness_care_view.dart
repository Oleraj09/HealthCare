import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care/app/data/constant.dart';
 

import '../../../routes/app_pages.dart';
import '../controllers/fitness_care_controller.dart';

class FitnessCareView extends GetView<FitnessCareController> {
  @override
  Widget build(BuildContext context) {
    final bmi = ConstantVariable.bmi.value;
    return Scaffold(
      body: Center(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 10.0),
                    child: Row(children: [
                      Image.asset(
                        'assets/images/fitness_care.png',
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "Fitness & Exercise".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      )
                    ]),
                  ),
                  decoration: const BoxDecoration(color: Color(0xff8dbce7)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Image.asset(
                    'assets/images/gym_exercise.jpg',
                    fit: BoxFit.cover,
                  ),
                  decoration: const BoxDecoration(color: Color(0xff8dbce7)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       const   Expanded(
                            flex: 3,
                            child: Text(
                              "-> 12 Steps\n->20 Minutes\n->Can Keep Your Health Fit. Maintain Regular Exercise",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        primary: const Color(0xff3863fa)),
                                    onPressed: () {
                                      controller
                                          .showPicker(context)
                                          .whenComplete(() => controller
                                                  .showScheduledNotification(
                                                id: ConstantVariable.age.value,
                                                title:
                                                    'HI ${ConstantVariable.fullName.value}',
                                                body:
                                                    'Its ${controller.timeHour}:${controller.timeMinute!}\nGet ready for exercise',
                                                payload: 'Routes.FITNESS_CARE',
                                              ));

                                     
                                    },
                                    child: const Text(
                                      "Reminder",
                                      style: TextStyle(fontSize: 10),
                                    ))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/abdominal_crunches.png',
                      name: "Abdominal Crunches",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/cobra_stretch.png',
                      name: "Cobra Stretch",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/floor_tricep_dips.png',
                      name: "Floor Tricep Dips",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/jumping_jack.png',
                      name: "Jumping Jack",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/knee_push_up.png',
                      name: "Knee Push Up",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/leg_raises.png',
                      name: "Leg Raise",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/mountain_climber.png',
                      name: "Mountain Climber",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/plank.png',
                      name: "Plank",
                      count: bmi <= 18.4
                          ? '10s Seconds'
                          : (bmi <= 24.9
                              ? "15s Seconds"
                              : (bmi <= 39.9 ? "10s Seconds" : "5s Seconds")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/push_up.png',
                      name: "Push Up",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/sholder_gators.png',
                      name: "Sholder Gators",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/skiping_without_rope.png',
                      name: "Skiping Without Rope",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    exerciseContainer(
                      context: context,
                      img: 'assets/images/icon/bmi/squats.png',
                      name: "Squats",
                      count: bmi <= 18.4
                          ? '10x Times'
                          : (bmi <= 24.9
                              ? "15x Times"
                              : (bmi <= 39.9 ? "5x Times" : "2x Times")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                  ]),
                  decoration: const BoxDecoration(color: Color(0xffbde7f0)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
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
                ),
              ),
            ],
          ),
    
        ]),
      ),
    );
  }

  GestureDetector exerciseContainer(
      {required BuildContext context,
      required String img,
      required String name,
      required String count}) {
    return GestureDetector(
      onTap: () => Get.defaultDialog(
          title: "EXERCISE MENU",
          backgroundColor: const Color(0xff8cbcd7),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
         const    Divider(
                thickness: 1.2,
                color: Colors.black,
              ),
              Hero(
                tag: name,
                child: Image.asset(img,
                    height: MediaQuery.of(context).size.height / 5),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Text(
                count,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff6c61ed),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize: Size(MediaQuery.of(context).size.width / 3.5,
                          MediaQuery.of(context).size.height / 30)),
                  onPressed: () => Get.back(),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          )),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xffb2f3e8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: name,
                child: Image.asset(
                  img,
                  height: MediaQuery.of(context).size.height / 10,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(count,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
