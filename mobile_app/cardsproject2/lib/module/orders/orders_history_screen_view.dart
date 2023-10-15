import 'package:cardsproject2/module/orders/order_details/order_details_screen_view.dart';
import 'package:cardsproject2/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/custom_header.dart';
import 'order_details/order_item_details_screen_view.dart';
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
          Obx(() =>  CustomHeader(
              lable: 'Number of Orders: ${_ordersController.orders.length}',
              icon: ImagePath.myOrders,
              action: () {},
              actionIcon: ImagePath.filter,
              isBackable: false,
            ),
          ),
          buildOrdersList(),
        ],
      ),
    );
  }

  buildOrdersList() {
    return SizedBox(
      height: Get.height * 0.77,
      child: Obx(() =>  ListView.builder(
          itemCount: _ordersController.orders.length,
          itemBuilder: (context, index) => OrderListItem(
            order: _ordersController.orders[index],
            onTap: () {
              if(_ordersController.orders[index].type?.id == 1){
                Get.to(
                      () => OrderDetailsScreen(order: _ordersController.orders[index],),
                  transition: Transition.noTransition,
                );
              }else{
                Get.to(
                    () => OrderItemDetailsScreen(
                      order: _ordersController.orders[index],
                      cardIndex: index,
                    ) ,
                  transition: Transition.noTransition,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
