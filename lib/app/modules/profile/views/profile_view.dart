import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care/app/data/constant.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final heightBox = MediaQuery.of(context).size.height / 35;

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          firstContainer(context, heightBox),
          secondContainer(),
          thirdContainer(),
        ],
      )),
    );
  }

  Expanded secondContainer() {
    return Expanded(
          flex: 4,
          child: Container(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 20.0, bottom: 10.0),
                child: Stack(alignment: Alignment.topCenter, children: [
             const     Positioned(
                    child: Text(
                      "MEDICAL HISTORY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  FutureBuilder<QuerySnapshot>(
                      future: controller.getMedicalHistory(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.connectionState ==
                                ConnectionState.active ||
                            snapshot.connectionState ==
                                ConnectionState.done) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final data = snapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                data['disease'],
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                data['medicine'],
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height /
                                            8,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffd9d9d9)),
                                  ),
                                );
                              },
                            );
                          }
                        } else {
                          return const Text("Eror");
                        }
                      })
                ])),
            decoration: const BoxDecoration(color: Color(0xffbde7f0)),
          ),
        );
  }

  Expanded thirdContainer() {
    return Expanded(
      flex: 1,
      child: Container(
        child: Row(children: [
          Expanded(
            flex: 25,
            child: GestureDetector(
              onTap: () => Get.toNamed(Routes.WELCOME),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Home".toUpperCase(),
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
    );
  }

  Expanded firstContainer(BuildContext context, var heightBox) {
    return Expanded(
      flex: 3,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 40.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/health.png',
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                  const  Text(
                      "Dashboard",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 40,
                      child: Image.asset(ConstantVariable.gender.value == 'Male'
                          ? 'assets/images/boy.png'
                          : 'assets/images/girl.png')),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Obx(() => Text(
                        ConstantVariable.fullName.value,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "GENDER: " +
                              ConstantVariable.gender.value.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "AGE: " + ConstantVariable.age.value.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "HEIGHT: " +
                              (ConstantVariable.height.value * 0.3048)
                                  .toStringAsFixed(2) +
                              " meters",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "WEIGHT: " +
                              ConstantVariable.weight.value.toString() +
                              " KG",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Obx(() => Text(
                        "BMI: " + ConstantVariable.bmi.toStringAsFixed(1),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.dialog(
                        Scaffold(
                          backgroundColor: const Color(0xffdbe5f8),
                          body: Form(
                            key: controller.profileKey,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                      const  Text(
                                          "UPDATE INFO",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 35,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        IconButton(
                                            onPressed: () => Get.back(),
                                            icon: const Icon(Icons.cancel))
                                      ],
                                    ),
                                 const   Divider(
                                      thickness: 2.5,
                                      color: Colors.grey,
                                    ),
                                    fullNameForm(
                                        context: context,
                                        controller:
                                            controller.createAcc.fullNameText!),
                                    SizedBox(
                                      height: heightBox,
                                    ),
                                    // emailForm(
                                    //     context: context,
                                    //     controller: controller.createAcc.emailText!),
                                    Obx(() => radioButton()),
                                    ageForm(
                                        context: context,
                                        controller:
                                            controller.createAcc.ageText!),
                                    SizedBox(
                                      height: heightBox,
                                    ),
                                    heightForm(
                                        context: context,
                                        controller:
                                            controller.createAcc.heightText!),
                                    SizedBox(
                                      height: heightBox,
                                    ),
                                    weightForm(
                                        context: context,
                                        controller:
                                            controller.createAcc.weightText!),
                                    SizedBox(
                                      height: heightBox,
                                    ),
                                    updateButton(context)
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 25,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: const Color(0xff16cccc),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Text(
                          "UPDATE INFO",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
        decoration: const BoxDecoration(color: Color(0xff2d6ba4)),
      ),
    );
  }

  GestureDetector updateButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.profileKey.currentState!.validate()) {
          controller.updateInfo();

          Get.back();
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "Update".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: const Color(0xFF1d56e8),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Container weightForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "WEIGHT",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your weight";
          }
        },
      ),
    );
  }

  Container heightForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "HEIGHT",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your height";
          }
        },
      ),
    );
  }

  Container ageForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "AGE",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your age";
          }
        },
      ),
    );
  }

  Row radioButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const  Text("GENDER: "),
        Row(
          children: [
            Radio(
                value: "Male",
                groupValue: controller.createAcc.radioGroupValue.value,
                onChanged: (value) {
                  controller.createAcc.radioGroupValue.value = value.toString();
                }),
            const Text("Male"),
          ],
        ),
        Row(children: [
          Radio(
            value: "Female",
            groupValue: controller.createAcc.radioGroupValue.value,
            onChanged: (value) {
              controller.createAcc.radioGroupValue.value = value.toString();
            },
          ),
        const  Text("Female"),
        ]),
      ],
    );
  }

  Container emailForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "ENTER EMAIL",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your email";
          }
        },
      ),
    );
  }

  Container fullNameForm(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "FULL NAME",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty || val == null) {
            return "Enter your full name";
          }
        },
      ),
    );
  }
}
