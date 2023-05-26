import 'package:cardsproject2/module/main_container/main_container_controller.dart';
import 'package:cardsproject2/util/app_colors.dart';
import 'package:cardsproject2/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../home/home_screen_view.dart';
import '../orders/orders_history_screen_view.dart';

class MainContainerScreen extends StatelessWidget {
  MainContainerScreen({Key? key}) : super(key: key);

  final MainContainerController _mainContainerController =
      Get.put(MainContainerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBottomNavigationBar(context),
    );
  }

  buildBottomNavigationBar(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _mainContainerController.bottomNavigationBarController,
      screens: <Widget>[
        buildHomeScreen(),
        buildMyOrdersScreen(),
        buildNotificationsScreen(),
        buildSettingsScreen(),
      ],
      items: [
        PersistentBottomNavBarItem(
            icon: Obx(
              () => SvgPicture.asset(
                ImagePath.home,
                width: Get.width * 0.05,
                color: _mainContainerController.selectedTebIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.darkGrey,
              ),
            ),
            title: ("Home"),
            activeColorPrimary: AppColors.primaryColor,
            inactiveColorPrimary: AppColors.darkGrey,
            onPressed: (value) {
              _mainContainerController.changeSelectedTapIndex(0);
            }),
        PersistentBottomNavBarItem(
            icon: Obx(
              () => SvgPicture.asset(
                ImagePath.myOrders,
                width: Get.width * 0.05,
                color: _mainContainerController.selectedTebIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.darkGrey,
              ),
            ),
            title: ("My Orders"),
            activeColorPrimary: AppColors.primaryColor,
            inactiveColorPrimary: AppColors.darkGrey,
            onPressed: (value) {
              _mainContainerController.changeSelectedTapIndex(1);
            }),
        PersistentBottomNavBarItem(
            icon: Obx(
              () => SvgPicture.asset(
                ImagePath.notifications,
                width: Get.width * 0.05,
                color: _mainContainerController.selectedTebIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.darkGrey,
              ),
            ),
            title: ("Notifications"),
            activeColorPrimary: AppColors.primaryColor,
            inactiveColorPrimary: AppColors.darkGrey,
            onPressed: (value) {
              _mainContainerController.changeSelectedTapIndex(2);
            }),
        PersistentBottomNavBarItem(
            icon: Obx(
              () => SvgPicture.asset(
                ImagePath.settings,
                width: Get.width * 0.05,
                color: _mainContainerController.selectedTebIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.darkGrey,
              ),
            ),
            title: ("Settings"),
            activeColorPrimary: AppColors.primaryColor,
            inactiveColorPrimary: AppColors.darkGrey,
            onPressed: (value) {
              _mainContainerController.changeSelectedTapIndex(3);
            }),
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: false,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }

  buildHomeScreen() {
    return HomeScreen();
  }

  buildMyOrdersScreen() {
    return OrdersHistoryScreen();
  }

  buildNotificationsScreen() {
    return Container();
  }

  buildSettingsScreen() {
    return Container();
  }
}
