import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../util/app_colors.dart';
import '../util/common_widgets.dart';
import '../util/images_path.dart';
import '../util/text_styles.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    required this.balance,
    required this.currency,
    super.key,
  });

  final double balance;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Container(
        width: Get.width,
        height: Get.height * 0.1,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(Get.width * 0.02),
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.03),
          child: Row(
            children: [
              SvgPicture.asset(
                ImagePath.wallet,
                color: AppColors.white,
                height: Get.height * 0.07,
              ),
              CommonWidgets().buildHorizontalSpace(space: 0.02),
              Text(
                '$balance $currency',
                style: TextStyles.bodySmall.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  ImagePath.plus,
                  color: AppColors.white,
                  height: Get.height * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
