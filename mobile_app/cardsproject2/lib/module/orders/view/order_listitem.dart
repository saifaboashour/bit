import 'package:cardsproject2/module/orders/model/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/formatters/date_helper.dart';
import '../../../util/text_styles.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.onTap,
    required this.order,
  });

  final Function() onTap;
  final Order order;

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
                        'Order ID: ',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Operator: ',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Type: ',
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
                        '${order.id}',
                        style: TextStyles.captionLarge,
                      ),
                      Text(
                        order.type?.name ?? '-',
                        style: TextStyles.captionLarge,
                      ),
                      Text(
                        order.category?.name ?? '-',
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
                        DateHelper().formatDateDMY(order.createdAt),
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
