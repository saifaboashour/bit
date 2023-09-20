import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/navigation/routes.dart';
import '../../../util/images_path.dart';
import '../../../view/custom_header.dart';
import '../home_controller.dart';
import '../view/category_item.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({
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
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 5,
          itemBuilder: (context, index) => CategoryItem(
            onTap: () {
              Get.toNamed(Routes.productDetails);
            },
          ),
        ),
      ),
    );
  }
}
