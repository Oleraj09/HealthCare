import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/medicine_disease_info_controller.dart';

class MedicineDiseaseInfoView extends GetView<MedicineDiseaseInfoController> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: firstContainer(context, isKeyboard),
          ),
          Expanded(
            flex: 4,
            child: secondContainer(context),
          ),
          if (!isKeyboard)                                                      //For hiding keyboard while typing
            Expanded(
              flex: 1,
              child: thirdContainer(),
            ),
        ],
      )),
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
            height: MediaQuery.of(context).size.height / 5,
            child: Padding(
              padding: const EdgeInsets.all(8 * 3.0),
              child: Obx(() => ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.foundDisease.length,
                    itemBuilder: ((context, index) {
                      final disease = controller.foundDisease[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: diseaseContainer(
                            context: context,
                            disease: disease['disease'],
                            cause: disease['cause'],
                            symptoms: disease['symptoms'],
                            reference: disease['reference']),
                      );
                    }),
                  )),
            ),
            decoration: const BoxDecoration(color: Color(0xffbde7f0)),
          );
  }

  Container firstContainer(BuildContext context, bool isKeyboard) {
    return Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/medical-record.png',
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 70,
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "DISEASE & MEDICINE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800),
                              ),
                              const Text(
                                "Find your Desire Disease and Medicine with Price",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      width:
                                          MediaQuery.of(context).size.width /
                                              2,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: TextField(
                                          controller: controller
                                              .diseaseSearchNameController,
                                          onChanged: (val) {
                                            controller.searchDisease(val);
                                          },
                                          decoration: const InputDecoration(
                                              hintText: 'Type your Disease',
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide.none)),
                                        ),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        25,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.5,
                                              MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  30),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {},
                                      child: const Text(
                                        "Search",
                                      ))
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  if (!isKeyboard)
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width / 2,
                                  MediaQuery.of(context).size.height / 25),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Get.dialog(Scaffold(
                              backgroundColor: const Color(0xffdbe5f8),
                              body: Container(
                                  child: Form(
                                key: controller.diseaseInfoKey,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "MEDICINE REMINDER",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 30),
                                            ),
                                            IconButton(
                                                onPressed: () => Get.back(),
                                                icon: const Icon(
                                                  Icons.cancel,
                                                  size: 25,
                                                ))
                                          ],
                                        ),
                                        const Divider(
                                          thickness: 2.0,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              25,
                                        ),
                                        diseaseReminderContainer(
                                            context: context,
                                            title: "DISEASE NAME",
                                            controller: controller
                                                .diseaseNameController!),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              25,
                                        ),
                                        diseaseReminderContainer(
                                            context: context,
                                            title: "MEDICINE USED",
                                            controller: controller
                                                .medicineNameController!),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              25,
                                        ),
                                        diseaseReminderContainer(
                                            context: context,
                                            title: "DOCTOR NAME",
                                            controller: controller
                                                .doctorNameController!),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              25,
                                        ),
                                        Obx(() => Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "Medicine Taking Time",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            10,
                                                  ),
                                                  DropdownButton(
                                                      value: controller
                                                          .dropdownValue
                                                          .value,
                                                      items: controller
                                                          .dropdownItem
                                                          .map((element) {
                                                        return DropdownMenuItem(
                                                            value: element,
                                                            child: Text(element
                                                                .toString()));
                                                      }).toList(),
                                                      onChanged: (val) {
                                                        controller
                                                                .dropdownValue
                                                                .value =
                                                            val as int;
                                                        print(controller
                                                            .dropdownValue
                                                            .value);
                                                      }),
                                                ],
                                              ),
                                            )),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              25,
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      const Color(0xffc79696),
                                                  fixedSize: Size(
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          25),
                                                  shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10))),
                                              onPressed: () {
                                                if (controller.diseaseInfoKey
                                                    .currentState!
                                                    .validate()) {
                                                  controller
                                                      .submitMedicineReminder();
                                                  Get.toNamed(
                                                      Routes.SETTINGS);
                                                  controller.clearText();
                                                }
                                              },
                                              child: const Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        )
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                ),
                              )),
                            ));
                          },
                          child: const Text(
                            "MEDICINE REMINDER",
                          )),
                    )
                ],
              ),
            ),
            decoration: const BoxDecoration(color: Color(0xff8dbce7)),
          );
  }

  Container diseaseReminderContainer({
    required BuildContext context,
    required TextEditingController controller,
    required String title,
  }) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
          validator: (val) {
            if (val!.isEmpty || val == null) {
              return title;
            }
          },
          controller: controller,
          decoration: InputDecoration(
              hintText: title,
              border: const OutlineInputBorder(borderSide: BorderSide.none))),
    );
  }

  Container diseaseContainer(
      {required BuildContext context,
      required String disease,
      required String cause,
      required String symptoms,
      required String reference}) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      decoration: const BoxDecoration(
        color: Color(0xffd9d9d9),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                disease,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Cause: ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 16, 12, 12),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: cause,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 16, 12, 12),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Symptoms: ',
                        style: TextStyle(
                            color: Color(0xFF100C0C),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: symptoms,
                        style: const TextStyle(
                          color: Color(0xFF100C0C),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Reference: ',
                        style: TextStyle(
                            color: Color(0xFF100C0C),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: reference,
                        style: const TextStyle(
                          color: Color(0xFF100C0C),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
