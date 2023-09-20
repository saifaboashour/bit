import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonWidgets {
  buildVerticalSpace({space = 0.01}) {
    return SizedBox(
      height: Get.height * space,
    );
  }

  buildHorizontalSpace({space = 0.01}) {
    return SizedBox(
      width: Get.width * space,
    );
  }
}
