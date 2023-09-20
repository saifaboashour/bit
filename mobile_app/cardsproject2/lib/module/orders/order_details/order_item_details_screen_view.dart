import 'package:cardsproject2/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/common_widgets.dart';
import '../../../util/images_path.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/custom_header.dart';
// import '../orders_controller.dart';
import 'view/order_item_details_row.dart';

class OrderItemDetailsScreen extends StatelessWidget {
  const OrderItemDetailsScreen({
    super.key,
  });

  // final OrdersController _ordersController = Get.find();

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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderItemDetailsRow(
                  title: 'Order ID: ',
                  value: '4563',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Operator: ',
                  value: 'Zain',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Type: ',
                  value: 'GSM 1 JD',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Price: ',
                  value: '1.95 JOD',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Custom Info: ',
                  value: 'G.......',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Device Name: ',
                  value: 'SM Samsung A23',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Operation Date: ',
                  value: '14-01-2023',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Operation Time: ',
                  value: '10:14 PM',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Status: ',
                  value: 'Pending',
                  width: 0.4,
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
