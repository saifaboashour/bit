import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/common_widgets.dart';
import '../../../../../util/text_styles.dart';

class CreditRequestListItem extends StatelessWidget {
  const CreditRequestListItem({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

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
                  height: Get.height * 0.08,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transfer ID: ',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Amount: ',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Type: ',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Status: ',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.08,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'data',
                        style: TextStyles.captionLarge,
                      ),
                      Text(
                        'data',
                        style: TextStyles.captionLarge,
                      ),
                      Text(
                        'data',
                        style: TextStyles.captionLarge,
                      ),
                      Text(
                        'data',
                        style: TextStyles.captionLarge,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: Get.height * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '14-01-2023',
                        style: TextStyles.captionLarge
                            .copyWith(color: AppColors.darkGrey),
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