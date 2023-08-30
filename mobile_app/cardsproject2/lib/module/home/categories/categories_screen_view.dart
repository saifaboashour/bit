import 'package:cardsproject2/module/home/products/products_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/images_path.dart';
import '../../../view/custom_header.dart';
// import '../home_controller.dart';
import '../view/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  // final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: '98.05 USD',
              icon: ImagePath.wallet,
              action: () {},
              actionIcon: ImagePath.plus,
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
          itemCount: 3,
          itemBuilder: (context, index) => CategoryItem(
            onTap: () {
              Get.to(
                () => const ProductsScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
        ),
      ),
    );
  }
}
