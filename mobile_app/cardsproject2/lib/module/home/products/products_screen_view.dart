import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/local_storage_manager/user_service.dart';
import '../../../service/navigation/routes.dart';
import '../../../util/images_path.dart';
import '../../../view/custom_header.dart';
import '../home_controller.dart';
import '../view/product_item.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({
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
            buildSubCategoriesGrid(),
          ],
        ),
      ),
    );
  }

  buildSubCategoriesGrid() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: SizedBox(
        width: Get.width,
        height: Get.height * 0.75,
        child: Obx(() =>  GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: _homeController.productsList.length,
            itemBuilder: (context, index) =>
                ProductItem(
              product: _homeController.productsList[index],
              onTap: () {
                _homeController.getProductDetailsDate(_homeController.productsList[index].id ?? 0);
                Get.toNamed(Routes.productDetails);
              },
            ),
          ),
        ),
      ),
    );
  }
}
