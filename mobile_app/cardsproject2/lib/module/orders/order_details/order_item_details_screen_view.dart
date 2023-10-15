import 'package:cardsproject2/module/orders/model/order.dart';
import 'package:cardsproject2/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/local_storage_manager/user_service.dart';
import '../../../util/common_widgets.dart';
import '../../../util/formatters/date_helper.dart';
import '../../../util/images_path.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/custom_header.dart';
// import '../orders_controller.dart';
import 'view/order_item_details_row.dart';

class OrderItemDetailsScreen extends StatelessWidget {
  OrderItemDetailsScreen({
    super.key,
    required this.order,
    required this.cardIndex,
  });

 final Order order;
 final int cardIndex;
  final userService = Get.find<UserService>();

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
                OrderItemDetailsRow(
                  title: 'Order ID: ',
                  value: '${order.id}',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Operator: ',
                  value: '${order.type?.name}',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Type: ',
                  value: '${order.category?.name}',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Price: ',
                  value: '${order.product?.price} ${userService.user.currency?.symbol}',
                  width: 0.4,
                ),
                buildCustomInfo(),
                OrderItemDetailsRow(
                  title: 'Device Name: ',
                  value: '${order.deviceName}',
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Operation Date: ',
                  value: DateHelper().formatDateDMY(order.createdAt),
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Operation Time: ',
                  value: DateHelper().formatDateHM(order.createdAt),
                  width: 0.4,
                ),
                OrderItemDetailsRow(
                  title: 'Status: ',
                  value: '${order.status}',
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

  buildCustomInfo(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  order.type?.id == 1 ? [
        OrderItemDetailsRow(
          title: 'Card Number 1: ',
          value: '${order.prepaidCard?[cardIndex].number1}',
          width: 0.4,
        ),
        OrderItemDetailsRow(
          title: 'Card Number 2: ',
          value: '${order.prepaidCard?[cardIndex].number2}',
          width: 0.4,
        ),
        OrderItemDetailsRow(
          title: 'Serial Number 1: ',
          value: '${order.prepaidCard?[cardIndex].serial1}',
          width: 0.4,
        ),
        OrderItemDetailsRow(
          title: 'Serial Number 2: ',
          value: '${order.prepaidCard?[cardIndex].serial2}',
          width: 0.4,
        ),
        OrderItemDetailsRow(
          title: 'CVC: ',
          value: '${order.prepaidCard?[cardIndex].cvc}',
          width: 0.4,
        ),
        OrderItemDetailsRow(
          title: 'Expiration Date: ',
          value: '${order.prepaidCard?[cardIndex].expirationDate}',
          width: 0.4,
        ),
      ] : (order.product?.inputFields?.map((inputField) => OrderItemDetailsRow(
        title: '${inputField.name}: ',
        value: '${inputField.answer}',
        width: 0.4,
      )).toList() ?? []));
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
