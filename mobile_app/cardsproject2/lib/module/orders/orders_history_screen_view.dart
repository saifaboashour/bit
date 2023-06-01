import 'package:cardsproject2/module/orders/order_details/order_details_screen_view.dart';
import 'package:cardsproject2/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/custom_header.dart';
import 'orders_controller.dart';
import 'view/order_listitem.dart';

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
            isBackable: false,
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
        itemCount: 5,
        itemBuilder: (context, index) => OrderListItem(
          onTap: () {
            Get.to(
              () => OrderDetailsScreen(),
              transition: Transition.noTransition,
            );
          },
        ),
      ),
    );
  }
}
