import 'package:cardsproject2/util/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../util/text_styles.dart';

class OrderItemDetailsRow extends StatelessWidget {
  const OrderItemDetailsRow({
    super.key,
    required this.title,
    required this.value,
    this.titleColor = AppColors.semiBlack,
    this.valueColor = AppColors.semiBlack,
  });

  final String title;
  final String value;
  final Color titleColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.captionLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        Text(
          value,
          style: TextStyles.captionLarge.copyWith(
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
