import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../util/app_colors.dart';
import '../util/common_widgets.dart';
import '../util/text_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.lable,
    required this.icon,
    required this.action,
    required this.actionIcon,
    this.isBackable = true,
    this.onBack,
  });

  final String lable;
  final String icon;
  final String? actionIcon;
  final Function() action;
  final bool isBackable;
  final Function()? onBack;

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
              isBackable
                  ? InkWell(
                      onTap: () {
                        if(onBack != null){
                          onBack!();
                        }
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.white,
                      ),
                    )
                  : const SizedBox(),
              isBackable
                  ? CommonWidgets().buildHorizontalSpace(space: 0.02)
                  : const SizedBox(),
              SvgPicture.asset(
                icon,
                color: AppColors.white,
                height: Get.height * 0.07,
              ),
              CommonWidgets().buildHorizontalSpace(space: 0.02),
              Text(
                lable,
                style: TextStyles.bodySmall.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              actionIcon != null
                  ? InkWell(
                      onTap: action,
                      child: SvgPicture.asset(
                        actionIcon!,
                        color: AppColors.white,
                        height: Get.height * 0.03,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
