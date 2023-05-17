import 'package:cardsproject2/util/app_colors.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.action,
    this.width = 1,
    this.height = 0.06,
  });

  final double width;
  final double height;
  final String label;
  final Function() action;

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
        child: Center(
          child: Text(
            label,
            style: TextStyles.bodyLarge.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
