import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../service/local_storage_manager/user_service.dart';
import '../../../util/app_colors.dart';
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
  final userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => CustomHeader(
                lable:
                    '${userService.user.credit} ${userService.user.currency?.symbol}',
                icon: ImagePath.wallet,
                action: () {},
                actionIcon: ImagePath.plus,
                isBackable: true,
              ),
            ),
            Expanded(
              child: buildProductPage(),
            ),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  buildProductPage(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImageQuantity(),
          buildProductDetails(),
          buildInputFields(),
        ],
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
                color: AppColors.ligthGrey,
                borderRadius: BorderRadius.circular(Get.width * 0.01),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Get.width * 0.02),
                child: Obx(() =>  Image.network(
                    '${_homeController.product.image}',
                    fit: BoxFit.cover,
                    errorBuilder: (context,_,e) => const SizedBox(),
                  ),
                ),
              ),
            ),
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            Obx(() =>  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonWidgets().buildHorizontalSpace(space: 0.61),
                  OrderItemDetailsRow(
                      title: 'Price: ',
                      value: '${_homeController.product.price} ${userService.user.currency?.symbol}',
                      width: 0.16,
                  ),
                  _homeController.product.type?.id == 1 ? CommonWidgets().buildVerticalSpace() : const SizedBox(),
                  _homeController.product.type?.id == 1 ?QuantityInput(
                    onChnage: (int quantity) {
                      _homeController.changeProductSelectedQuantity(quantity);
                    },
                  ) : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildProductDetails() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderItemDetailsRow(
                title: 'Product Name: ',
                value: '${_homeController.product.name}',
            ),
            OrderItemDetailsRow(
              title: 'Provider: ',
              value: '${_homeController.product.category?.name}',
            ),
            Obx(() =>  OrderItemDetailsRow(
                title: 'Price: ',
                value: '${_homeController.product.price} ${userService.user.currency?.symbol}',
              ),
            ),
            OrderItemDetailsRow(
              title: 'Suggested Price: ',
              value: '${_homeController.product.suggestedPrice} ${userService.user.currency?.symbol}',
            ),
            Obx(() =>  OrderItemDetailsRow(
                title: 'Product Details: ',
                value: '${_homeController.product.description}',
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildInputFields(){
    return Obx(() => Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: _homeController.inputFields,
        ),
    ),
    );
  }

  buildButtons(){
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.ligthGrey.withOpacity(0.25),
            blurRadius: 5,
            offset: const Offset(0,-5),
            spreadRadius: 0,
          ),
        ]
      ),
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => _homeController.product.type?.id == 1 ? Center(
                child: PrimaryButton(
                  label: 'Print',
                  width: 0.9,
                  action: () {
                    _homeController.purchase(true);
                  },
                ),
              ) : const SizedBox(),
            ),
            CommonWidgets().buildVerticalSpace(),
            Center(
              child: PrimaryButton(
                label: 'Purchase',
                width: 0.9,
                action: () {
                  _homeController.purchase(false);
                },
              ),
            ),
            CommonWidgets().buildVerticalSpace(),
            Obx(() => _homeController.product.type?.id == 1 ? Row(
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
              ) : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
