import 'package:cardsproject2/util/common_widgets.dart';
import 'package:cardsproject2/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../view/custom_header.dart';
import 'orders_controller.dart';

class OrdersHistoryScreen extends StatelessWidget {
  OrdersHistoryScreen({
    super.key,
  });

  final OrdersController _ordersController = Get.put(OrdersController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomHeader(
            lable: 'Number of Orders: 5',
            icon: ImagePath.myOrders,
            action: () {},
            actionIcon: ImagePath.filter,
          ),
          buildOrdersList(),
        ],
      ),
    );
  }

  buildOrdersList() {
    return SizedBox(
      height: Get.height * 0.7,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(Get.width * 0.01),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(Get.width * 0.02),
              ),
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.01),
                child: Row(
                  children: [
                    Container(
                      height: Get.width * 0.3,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(Get.width * 0.02),
                      ),
                    ),
                    CommonWidgets().buildHorizontalSpace(),
                    Column(
                      children: [
                        Text(
                          'data',
                        ),
                        Text(
                          'data',
                        ),
                        Text(
                          'data',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
