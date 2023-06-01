import 'package:cardsproject2/util/app_colors.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/common_widgets.dart';
import '../../../util/images_path.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/custom_header.dart';
import '../orders_controller.dart';
import 'view/order_item_details_row.dart';

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
              children: const [
                OrderItemDetailsRow(
                  title: 'Order ID: ',
                  value: '4563',
                ),
                OrderItemDetailsRow(
                  title: 'Operator: ',
                  value: 'Zain',
                ),
                OrderItemDetailsRow(
                  title: 'Type: ',
                  value: 'GSM 1 JD',
                ),
                OrderItemDetailsRow(
                  title: 'Price: ',
                  value: '1.95 JOD',
                ),
                OrderItemDetailsRow(
                  title: 'Custom Info: ',
                  value: 'G.......',
                ),
                OrderItemDetailsRow(
                  title: 'Device Name: ',
                  value: 'SM Samsung A23',
                ),
                OrderItemDetailsRow(
                  title: 'Operation Date: ',
                  value: '14-01-2023',
                ),
                OrderItemDetailsRow(
                  title: 'Operation Time: ',
                  value: '10:14 PM',
                ),
                OrderItemDetailsRow(
                  title: 'Status: ',
                  value: 'Pending',
                  valueColor: AppColors.darkGrey,
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
