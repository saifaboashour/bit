import 'package:cardsproject2/module/home/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../service/local_storage_manager/user_service.dart';
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
  final userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => _homeController.isLoading ?
          buildLoadingPage()
          : Column(
          children: [
            buildNewsSection(),
            const Divider(
              color: AppColors.darkGrey,
            ),
            Obx(
              () => CustomHeader(
                lable:
                    '${userService.user.credit} ${userService.user.currency?.symbol}',
                icon: ImagePath.wallet,
                action: () {},
                actionIcon: ImagePath.plus,
                isBackable: false,
              ),
            ),
            buildTypesTabs(),
            Expanded(
              child: buildCategoriesGrid(),
            ),
          ],
        ),
      ),
    );
  }

  buildNewsSection() {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _homeController.newsScrollController,
            itemCount: _homeController.newsList.length,
            itemBuilder: (context, index) => Center(
              child: Text(
                '${_homeController.newsList[index].title} - ${_homeController.newsList[index].description}${index != _homeController.newsList.length - 1 ? ' • ' : ''}',
              ),
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
              isSelected: _homeController.selectedType == 0,
              icon: ImagePath.simCard,
              action: () {
                _homeController.changeSelectedType(0);
              },
            ),
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            CategoriesTypeItem(
              isSelected: _homeController.selectedType == 1,
              icon: ImagePath.gamesController,
              action: () {
                _homeController.changeSelectedType(1);
              },
            ),
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            CategoriesTypeItem(
              isSelected: _homeController.selectedType == 2,
              icon: ImagePath.bill,
              action: () {
                _homeController.changeSelectedType(2);
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
        child: Obx(() =>  GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: _homeController.categoriesList.length,
            itemBuilder: (context, index) => CategoryItem(
              category: _homeController.categoriesList[index],
              onTap: () {
                _homeController.getSubCategoriesDate(_homeController.categoriesList[index].id ?? 0);
                Get.toNamed(Routes.categories);
              },
            ),
          ),
        ),
      ),
    );
  }

  buildLoadingPage(){
    return Shimmer.fromColors(
      baseColor:  Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.05,
            color: Colors.grey,
          ),
          const Divider(
            color: AppColors.darkGrey,
          ),
          Padding(
            padding: EdgeInsets.all(Get.width * 0.02),
            child: Container(
              width: Get.width,
              height: Get.height * 0.1,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(Get.width * 0.02),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Get.width * 0.02),
            child: Row(
                children: [
                  CategoriesTypeItem(
                    isSelected: _homeController.selectedType == 0,
                    icon: ImagePath.simCard,
                    action: () {},
                  ),
                  CommonWidgets().buildHorizontalSpace(space: 0.02),
                  CategoriesTypeItem(
                    isSelected: _homeController.selectedType == 1,
                    icon: ImagePath.gamesController,
                    action: () {},
                  ),
                  CommonWidgets().buildHorizontalSpace(space: 0.02),
                  CategoriesTypeItem(
                    isSelected: _homeController.selectedType == 2,
                    icon: ImagePath.bill,
                    action: () {},
                  ),
                ],
              ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 5,
              itemBuilder: (context, index) => CategoryItem(
                category: Category(),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
