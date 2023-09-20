import 'package:cardsproject2/util/app_colors.dart';
import 'package:cardsproject2/util/common_widgets.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.action,
    this.width = 1,
    this.height = 0.06,
    this.icon = '',
  });

  final double width;
  final double height;
  final String label;
  final Function() action;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        width: Get.width * width,
        height: Get.height * height,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != ''
                ? SvgPicture.asset(
                    icon,
                    color: AppColors.white,
                    height: Get.height * 0.03,
                  )
                : const SizedBox(),
            icon != ''
                ? CommonWidgets().buildHorizontalSpace(space: 0.02)
                : const SizedBox(),
            Text(
              label,
              style: TextStyles.bodyLarge.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
