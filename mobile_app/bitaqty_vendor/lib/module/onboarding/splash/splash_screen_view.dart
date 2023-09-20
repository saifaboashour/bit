import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/images_path.dart';
import 'splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenController _splashScreenController =
      Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Center(
          child: Image.asset(
            ImagePath.logo,
          ),
        ),
      ),
    );
  }
}
