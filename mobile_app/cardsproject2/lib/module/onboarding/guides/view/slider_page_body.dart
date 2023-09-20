import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/text_styles.dart';

class SliderPageBody extends StatelessWidget {
  const SliderPageBody({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: Get.height * 0.5,
          ),
          Text(
            title,
            style: TextStyles.heading1.copyWith(color: AppColors.darkGrey),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            description,
            style: TextStyles.bodySmall.copyWith(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
