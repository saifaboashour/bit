import 'package:cardsproject2/util/common_widgets.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/images_path.dart';
import '../../view/custom_header.dart';
import 'account_settings/change_password_screen_view.dart';
import 'account_settings/edit_profile_screen_view.dart';
import 'app_settings/language/change_language_screen_view.dart';
import 'app_settings/printers/manage_printers_screen_view.dart';
import 'credit_settings/change_currency/change_currency_screen_view.dart';
import 'credit_settings/credit_history/credit_request_history_screen_view.dart';
import 'credit_settings/credit_request/credit_request_screen_view.dart';
import 'help/privacy_policy_screen_view.dart';
import 'help/support_screen_view.dart';
import 'help/terms_and_conditions_screen_view.dart';
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
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_settingsController.user.commercialName}',
                  style: TextStyles.captionLarge,
                ),
                Text(
                  '${_settingsController.user.email}',
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
            onTap: () {
              Get.to(
                () => const RequestCreditScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
          SettingsButton(
            title: 'Credit History',
            icon: ImagePath.creditHistory,
            onTap: () {
              Get.to(
                () => const CreditRequestHistoryScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
          SettingsButton(
            title: 'Change Currency',
            icon: ImagePath.changeCurrency,
            onTap: () {
              Get.to(
                () => const ChangeCurrencyScreen(),
                transition: Transition.noTransition,
              );
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
              Get.to(
                () => const ChangeLanguageScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
          SettingsButton(
            title: 'Manage Printers',
            icon: ImagePath.printer,
            onTap: () {
              Get.to(
                () => const ManagePrintersScreen(),
                transition: Transition.noTransition,
              );
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
              Get.to(
                () => const SupportScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
          SettingsButton(
            title: 'Privacy Policy',
            icon: ImagePath.privacyPolicy,
            onTap: () {
              Get.to(
                () => const PrivacyPolicyScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
          SettingsButton(
            title: 'Terms & Conditions',
            icon: ImagePath.termAndCondition,
            onTap: () {
              Get.to(
                () => const TermsAndConditionsScreen(),
                transition: Transition.noTransition,
              );
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
