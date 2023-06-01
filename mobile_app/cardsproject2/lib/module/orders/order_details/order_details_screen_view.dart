import 'package:cardsproject2/view/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/images_path.dart';
import '../../../view/custom_header.dart';
import '../orders_controller.dart';
import '../view/order_listitem.dart';
import 'order_item_details_screen_view.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({
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
              lable: 'Number of Items: 3',
              icon: ImagePath.myOrders,
              action: () {},
              actionIcon: ImagePath.filter,
            ),
            buildOrdersList(),
            buildPrintButton(),
          ],
        ),
      ),
    );
  }

  buildOrdersList() {
    return SizedBox(
      height: Get.height * 0.65,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => OrderListItem(
          onTap: () {
            Get.to(
              () => OrderItemDetailsScreen(),
              transition: Transition.noTransition,
            );
          },
        ),
      ),
    );
  }

  buildPrintButton() {
    return Center(
      child: PrimaryButton(
        label: 'Print All',
        width: 0.9,
        action: () {},
      ),
    );
  }
}
