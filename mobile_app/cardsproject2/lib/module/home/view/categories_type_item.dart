import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';

class CategoriesTypeItem extends StatelessWidget {
  const CategoriesTypeItem({
    required this.icon,
    required this.action,
    required this.isSelected,
    super.key,
  });

  final String icon;
  final Function() action;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        height: Get.height * 0.07,
        width: Get.height * 0.07,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.ligthGrey,
          borderRadius: BorderRadius.circular(Get.height * 0.05),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            height: Get.height * 0.035,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
