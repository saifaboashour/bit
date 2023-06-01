import 'package:cardsproject2/util/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/text_styles.dart';

class QuantityInput extends StatefulWidget {
  const QuantityInput({
    super.key,
    required this.onChnage,
    this.max = 10,
    this.min = 1,
  });

  final int max;
  final int min;
  final Function(int) onChnage;

  @override
  State<QuantityInput> createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  int quantity = 1;

  increment() {
    if (quantity < widget.max) {
      setState(() {
        quantity += 1;
      });
    }
  }

  decrement() {
    if (quantity > widget.min) {
      setState(() {
        quantity -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            decrement(); 
            widget.onChnage(quantity);
          },
          child: Container(
            height: Get.width * 0.1,
            width: Get.width * 0.1,
            decoration: BoxDecoration(
              color: quantity == widget.min
                  ? AppColors.ligthGrey
                  : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(
                Get.width * 0.1,
              ),
            ),
            child: Center(
              child: Text(
                '-',
                style: TextStyles.bodyLarge.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        CommonWidgets().buildHorizontalSpace(space: 0.02),
        Text(
          '$quantity',
        ),
        CommonWidgets().buildHorizontalSpace(space: 0.02),
        InkWell(
          onTap: () {
            increment();
            widget.onChnage(quantity);
          },
          child: Container(
            height: Get.width * 0.1,
            width: Get.width * 0.1,
            decoration: BoxDecoration(
              color: quantity == widget.max
                  ? AppColors.ligthGrey
                  : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(
                Get.width * 0.1,
              ),
            ),
            child: Center(
              child: Text(
                '+',
                style: TextStyles.bodyLarge.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
