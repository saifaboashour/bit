import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/local_storage_manager/user_service.dart';
import '../../../service/navigation/routes.dart';
import '../../../util/images_path.dart';
import '../../../view/custom_header.dart';
import '../home_controller.dart';
import '../view/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({
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
            itemCount: _homeController.subcategoriesList.length,
            itemBuilder: (context, index) =>
                CategoryItem(
                  category: _homeController.subcategoriesList[index],
              onTap: () {
                    _homeController.getProductsDate(_homeController.subcategoriesList[index].id ?? 0);
                Get.toNamed(Routes.products);
              },
            ),
          ),
        ),
      ),
    );
  }
}
