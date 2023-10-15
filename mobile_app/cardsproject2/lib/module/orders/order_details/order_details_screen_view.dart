import 'package:cardsproject2/module/orders/model/order.dart';
import 'package:cardsproject2/view/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/images_path.dart';
import '../../../view/custom_header.dart';
import 'order_item_details_screen_view.dart';
import 'view/order_item_details_row.dart';
import 'view/order_product_listitem.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Order #${order.id}',
              icon: ImagePath.myOrders,
              action: () {},
              actionIcon: ImagePath.filter,
            ),
            buildOrdersList() ,
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
        itemCount: order.prepaidCard?.length ?? 0,
        itemBuilder: (context, index) => OrderProductListItem(
          card: order.prepaidCard![index],
          onTap: () {
            Get.to(
              () =>  OrderItemDetailsScreen(
                order: order,
                cardIndex: index,
              ),
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
