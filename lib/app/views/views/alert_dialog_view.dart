import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care/app/routes/app_pages.dart';

class AlertDialogView extends GetView {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Did you drink water".toUpperCase()),
      actions: [
        TextButton(
            onPressed: () {
              Get.offAllNamed(Routes.WELCOME);
            },
            child: Text("NO")),
        TextButton(onPressed: () {}, child: Text("YES")),
      ],
    );
  }
}
