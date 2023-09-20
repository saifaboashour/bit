import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/common_widgets.dart';
import '../../../util/images_path.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/custom_header.dart';
import '../../../view/text_fields/quantity_field.dart';
import '../../orders/order_details/view/order_item_details_row.dart';
import '../home_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({
    super.key,
  });

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => CustomHeader(
                lable:
                    '${_homeController.user.credit} ${_homeController.user.currency?.symbol}',
                icon: ImagePath.wallet,
                action: () {},
                actionIcon: ImagePath.plus,
                isBackable: true,
              ),
            ),
            buildImageQuantity(),
            buildProductDetails(),
          ],
        ),
      ),
    );
  }

  buildImageQuantity() {
    return SizedBox(
      height: Get.height * 0.16,
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.width * 0.33,
              width: Get.width * 0.33,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(Get.width * 0.01),
              ),
            ),
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets().buildHorizontalSpace(space: 0.61),
                const OrderItemDetailsRow(
                  title: 'Price: ',
                  value: '1.40 JOD',
                  width: 0.16,
                ),
                CommonWidgets().buildVerticalSpace(),
                QuantityInput(
                  onChnage: (int quantity) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildProductDetails() {
    return SizedBox(
      height: Get.height * 0.61,
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrderItemDetailsRow(
              title: 'Product Name: ',
              value: 'Zain - GSM 0.5 JD',
            ),
            const OrderItemDetailsRow(
              title: 'Provider: ',
              value: 'Zain',
            ),
            const OrderItemDetailsRow(
              title: 'Price: ',
              value: '1.40 JOD',
            ),
            const OrderItemDetailsRow(
              title: 'Suggested Price: ',
              value: '1.65 JOD',
            ),
            const OrderItemDetailsRow(
              title: 'Product Details: ',
              value: 'Lorem Ipsum Lorem Ipsum Ipsum Lorem losrem s Ipsum.',
            ),
            const Spacer(),
            Center(
              child: PrimaryButton(
                label: 'Print',
                width: 0.9,
                action: () {},
              ),
            ),
            CommonWidgets().buildVerticalSpace(),
            Center(
              child: PrimaryButton(
                label: 'Purchase',
                width: 0.9,
                action: () {},
              ),
            ),
            CommonWidgets().buildVerticalSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PrimaryButton(
                  label: 'Send',
                  width: 0.43,
                  icon: ImagePath.whatsapp,
                  action: () {},
                ),
                PrimaryButton(
                  label: 'Copy',
                  width: 0.43,
                  icon: ImagePath.copy,
                  action: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
