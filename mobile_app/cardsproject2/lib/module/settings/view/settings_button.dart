import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/text_styles.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.01),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(Get.width * 0.02),
            boxShadow: [
              BoxShadow(
                color: AppColors.ligthGrey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.02),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: Get.height * 0.05,
                  color: AppColors.darkGrey,
                ),
                CommonWidgets().buildHorizontalSpace(space: 0.02),
                Text(
                  title,
                  style: TextStyles.captionSmall
                      .copyWith(color: AppColors.darkGrey),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.darkGrey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
