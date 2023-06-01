import 'package:cardsproject2/util/app_colors.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/common_widgets.dart';
import '../../../util/images_path.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/custom_header.dart';
import '../orders_controller.dart';

class OrderItemDetailsScreen extends StatelessWidget {
  OrderItemDetailsScreen({
    super.key,
  });

  final OrdersController _ordersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Order #4563',
              icon: ImagePath.myOrders,
              action: () {},
              actionIcon: null,
            ),
            buildOrderItemDetails(),
            buildPrintButton(),
          ],
        ),
      ),
    );
  }

  buildOrderItemDetails() {
    return SizedBox(
      height: Get.height * 0.65,
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Order ID: ',
                      style: TextStyles.captionLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '4563',
                      style: TextStyles.captionLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Operator: ',
                      style: TextStyles.captionLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Zain',
                      style: TextStyles.captionLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Type: ',
                      style: TextStyles.captionLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'GSM 1 JD',
                      style: TextStyles.captionLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Price: ',
                      style: TextStyles.captionLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '1.95 JOD',
                      style: TextStyles.captionLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Custom Info: ',
                      style: TextStyles.captionLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'G.......',
                      style: TextStyles.captionLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Device Name: ',
                      style: TextStyles.captionLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'SM Samsung A23',
                      style: TextStyles.captionLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Operation Date: ',
                      style: TextStyles.captionLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '14-01-2023',
                      style: TextStyles.captionLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Operation Time: ',
                      style: TextStyles.captionLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '10:14 PM',
                      style: TextStyles.captionLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Status: ',
                      style: TextStyles.captionLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Pending',
                      style: TextStyles.captionLarge.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildPrintButton() {
    return Center(
      child: PrimaryButton(
        label: 'Print',
        width: 0.9,
        action: () {},
      ),
    );
  }
}
