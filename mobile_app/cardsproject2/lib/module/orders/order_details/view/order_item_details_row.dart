import 'package:cardsproject2/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/text_styles.dart';

class OrderItemDetailsRow extends StatelessWidget {
  const OrderItemDetailsRow({
    super.key,
    required this.title,
    required this.value,
    this.titleColor = AppColors.semiBlack,
    this.valueColor = AppColors.semiBlack,
    this.width = 0.6,
  });

  final String title;
  final String value;
  final Color titleColor;
  final Color valueColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.captionLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        SizedBox(
          width: Get.width * width,
          child: Text(
            value,
            maxLines: 4,
            style: TextStyles.captionLarge.copyWith(
              color: valueColor,
            ),
          ),
        ),
      ],
    );
  }
}
