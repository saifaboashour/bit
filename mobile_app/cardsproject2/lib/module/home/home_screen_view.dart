import 'package:cardsproject2/module/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/app_colors.dart';
import '../../util/common_widgets.dart';
import '../../util/images_path.dart';
import '../../view/custom_header.dart';
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
          Container(
            // News Scrolling Bar
            width: Get.width,
            height: Get.height * 0.06,
            color: Colors.amber,
          ),
          const Divider(
            color: AppColors.darkGrey,
          ),
          CustomHeader(
            lable: '98.05 USD',
            icon: ImagePath.wallet,
            action: () {},
            actionIcon: ImagePath.plus,
          ),
          buildCategoryTabs(),
          buildSubCategoriesGrid(),
        ],
      ),
    );
  }

  buildCategoryTabs() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Row(
        children: [
          CategoryItem(
            isSelected: true,
            icon: ImagePath.simCard,
            action: () {},
          ),
          CommonWidgets().buildHorizontalSpace(space: 0.02),
          CategoryItem(
            isSelected: false,
            icon: ImagePath.gamesController,
            action: () {},
          ),
          CommonWidgets().buildHorizontalSpace(space: 0.02),
          CategoryItem(
            isSelected: false,
            icon: ImagePath.bill,
            action: () {},
          ),
        ],
      ),
    );
  }

  buildSubCategoriesGrid() {
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
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(Get.width * 0.01),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
