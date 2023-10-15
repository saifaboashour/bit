// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/common_widgets.dart';
import '../../../../util/formatters/date_helper.dart';
import '../../../../util/text_styles.dart';
import '../../model/card.dart' as model;

class OrderProductListItem extends StatelessWidget {
  const OrderProductListItem({
    super.key,
    required this.onTap,
    required this.card,
  });

  final Function() onTap;
  final model.Card card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.01,
        vertical: Get.height * 0.005,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
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
            padding: EdgeInsets.all(Get.width * 0.01),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: Get.width * 0.2,
                  width: Get.width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(Get.width * 0.01),
                  ),
                ),
                CommonWidgets().buildHorizontalSpace(space: 0.02),
                SizedBox(
                  height: Get.height * 0.07,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card ID: ',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Card Number: ',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Serial Number: ',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.07,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${card.id}',
                        style: TextStyles.captionLarge,
                      ),
                      Text(
                        card.number1 ?? '-',
                        style: TextStyles.captionLarge,
                      ),
                      Text(
                        card.serial1 ?? '-',
                        style: TextStyles.captionLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
