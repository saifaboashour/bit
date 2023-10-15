import 'package:cardsproject2/util/common_widgets.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/local_storage_manager/user_service.dart';
import '../../service/navigation/routes.dart';
import '../../util/app_colors.dart';
import '../../util/images_path.dart';
import '../../view/custom_header.dart';
import 'settings_controller.dart';
import 'view/settings_button.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({
    super.key,
  });

  final SettingsController _settingsController = Get.put(SettingsController());
  final userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Settings',
              icon: ImagePath.settings,
              action: () {},
              actionIcon: null,
              isBackable: false,
            ),
            buildUserInfoCard(),
            buildAccountSettingsSection(),
            buildCreditSettingsSection(),
            buildAppSettingsSection(),
            buildHelpSection(),
            buildLogoutSection(),
          ],
        ),
      ),
    );
  }

  buildUserInfoCard() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Row(
        children: [
          Obx(() =>  Container(
              height: Get.width * 0.25,
              width: Get.width * 0.25,
              decoration: BoxDecoration(
                color: AppColors.ligthGrey,
                borderRadius: BorderRadius.circular(Get.width * 0.01),
              ),
              child: Image.network('${userService.user.image}',errorBuilder: (context,_,e) => const SizedBox(),),
            ),
          ),
          CommonWidgets().buildHorizontalSpace(space: 0.02),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${userService.user.commercialName}',
                  style: TextStyles.captionLarge,
                ),
                Text(
                  '${userService.user.email}',
                  style: TextStyles.captionSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildAccountSettingsSection() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style:
                TextStyles.captionLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          SettingsButton(
            title: 'Edit Profile',
            icon: ImagePath.editProfile,
            onTap: () {
              Get.toNamed(Routes.editProfile);
            },
          ),
          SettingsButton(
            title: 'Change Password',
            icon: ImagePath.changePassword,
            onTap: () {
              Get.toNamed(Routes.changePassword);
            },
          ),
        ],
      ),
    );
  }

  buildCreditSettingsSection() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credit',
            style:
                TextStyles.captionLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          SettingsButton(
            title: 'Request Credit',
            icon: ImagePath.creditCard,
            onTap: () {
              Get.toNamed(Routes.requestCredit);
            },
          ),
          SettingsButton(
            title: 'Credit History',
            icon: ImagePath.creditHistory,
            onTap: () {
              Get.toNamed(Routes.creditHistory);
            },
          ),
          SettingsButton(
            title: 'Change Currency',
            icon: ImagePath.changeCurrency,
            onTap: () {
              Get.toNamed(Routes.changeCurrency);
            },
          ),
        ],
      ),
    );
  }

  buildAppSettingsSection() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App Settings',
            style:
                TextStyles.captionLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          SettingsButton(
            title: 'Change Language',
            icon: ImagePath.changeLanguage,
            onTap: () {
              Get.toNamed(Routes.changeLanguage);
            },
          ),
          SettingsButton(
            title: 'Manage Printers',
            icon: ImagePath.printer,
            onTap: () {
              Get.toNamed(Routes.managePrinters);
            },
          ),
        ],
      ),
    );
  }

  buildHelpSection() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Help',
            style:
                TextStyles.captionLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          SettingsButton(
            title: 'Support',
            icon: ImagePath.support,
            onTap: () {
              Get.toNamed(Routes.support);
            },
          ),
          SettingsButton(
            title: 'Privacy Policy',
            icon: ImagePath.privacyPolicy,
            onTap: () {
              Get.toNamed(Routes.privacyPolicy);
            },
          ),
          SettingsButton(
            title: 'Terms & Conditions',
            icon: ImagePath.termAndCondition,
            onTap: () {
              Get.toNamed(Routes.termsAndConditions);
            },
          ),
        ],
      ),
    );
  }

  buildLogoutSection() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidgets().buildVerticalSpace(space: 0.06),
          SettingsButton(
            title: 'logout',
            icon: ImagePath.logout,
            onTap: () {
              _settingsController.logout();
            },
          ),
          CommonWidgets().buildVerticalSpace(space: 0.02),
        ],
      ),
    );
  }
}
