import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.expand,
            children: [
          Image.asset(
            'assets/images/loading.webp',
            fit: BoxFit.fill,
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height / 15,
              height: MediaQuery.of(context).size.height / 50,
              width: MediaQuery.of(context).size.width / 1.2,
              child: LiquidLinearProgressIndicator(
                value: 0.9, // Defaults to 0.5.
                valueColor:const AlwaysStoppedAnimation(Color(
                    0xFF664242)), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.black,
                borderWidth: 1.0,
                borderRadius: 2.0,
                direction: Axis
                    .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center:const Text("Loading..."),
              ))
        ]));
  }
}
