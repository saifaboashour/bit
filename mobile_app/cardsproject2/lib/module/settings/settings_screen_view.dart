import 'package:cardsproject2/util/common_widgets.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/images_path.dart';
import '../../view/custom_header.dart';
import 'account_settings/change_password_screen_view.dart';
import 'account_settings/edit_profile_screen_view.dart';
import 'settings_controller.dart';
import 'view/settings_button.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({
    super.key,
  });

  final SettingsController _settingsController = Get.put(SettingsController());

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
          Container(
            height: Get.width * 0.25,
            width: Get.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(Get.width * 0.01),
            ),
          ),
          CommonWidgets().buildHorizontalSpace(space: 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bitaqty Store',
                style: TextStyles.captionLarge,
              ),
              Text(
                'saifaboashour@bitaqty.com',
                style: TextStyles.captionSmall,
              ),
            ],
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
              Get.to(
                () => EditProfileScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
          SettingsButton(
            title: 'Change Password',
            icon: ImagePath.changePassword,
            onTap: () {
              Get.to(
                () => ChangePasswordScreen(),
                transition: Transition.noTransition,
              );
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
            onTap: () {},
          ),
          SettingsButton(
            title: 'Credit History',
            icon: ImagePath.creditHistory,
            onTap: () {},
          ),
          SettingsButton(
            title: 'Change Currency',
            icon: ImagePath.changeCurrency,
            onTap: () {},
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
            onTap: () {},
          ),
          SettingsButton(
            title: 'Manage Printers',
            icon: ImagePath.printer,
            onTap: () {},
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
            onTap: () {},
          ),
          SettingsButton(
            title: 'Privacy Policy',
            icon: ImagePath.privacyPolicy,
            onTap: () {},
          ),
          SettingsButton(
            title: 'Terms & Conditions',
            icon: ImagePath.termAndCondition,
            onTap: () {},
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
            onTap: () {},
          ),
          CommonWidgets().buildVerticalSpace(space: 0.02),
        ],
      ),
    );
  }
}
