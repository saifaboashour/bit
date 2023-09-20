import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/navigation/routes.dart';
import '../../util/app_colors.dart';
import '../../util/common_widgets.dart';
import '../../util/images_path.dart';
import '../../view/custom_header.dart';
import 'home_controller.dart';
import 'view/categories_type_item.dart';
import 'view/category_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          buildNewsSection(),
          const Divider(
            color: AppColors.darkGrey,
          ),
          Obx(
            () => CustomHeader(
              lable:
                  '${_homeController.user.credit} ${_homeController.user.currency?.symbol}',
              icon: ImagePath.wallet,
              action: () {},
              actionIcon: ImagePath.plus,
              isBackable: false,
            ),
          ),
          buildTypesTabs(),
          buildCategoriesGrid(),
        ],
      ),
    );
  }

  buildNewsSection() {
    return Container(
      width: Get.width,
      height: Get.height * 0.06,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _homeController.newsScrollController,
          itemCount: 15,
          itemBuilder: (context, index) => Center(
            child: Text(
              'data $index',
            ),
          ),
        ),
      ),
    );
  }

  buildTypesTabs() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Obx(
        () => Row(
          children: [
            CategoriesTypeItem(
              isSelected: _homeController.selectedCategory == 0,
              icon: ImagePath.simCard,
              action: () {
                _homeController.changeSelectedCategory(0);
              },
            ),
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            CategoriesTypeItem(
              isSelected: _homeController.selectedCategory == 1,
              icon: ImagePath.gamesController,
              action: () {
                _homeController.changeSelectedCategory(1);
              },
            ),
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            CategoriesTypeItem(
              isSelected: _homeController.selectedCategory == 2,
              icon: ImagePath.bill,
              action: () {
                _homeController.changeSelectedCategory(2);
              },
            ),
          ],
        ),
      ),
    );
  }

  buildCategoriesGrid() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: SizedBox(
        width: Get.width,
        height: Get.height * 0.52,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 9,
          itemBuilder: (context, index) => CategoryItem(
            onTap: () {
              Get.toNamed(Routes.categories);
            },
          ),
        ),
      ),
    );
  }
}
