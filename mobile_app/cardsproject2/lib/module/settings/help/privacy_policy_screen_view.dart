import 'package:cardsproject2/util/app_colors.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/images_path.dart';
import '../../../view/custom_header.dart';
import 'help_settings_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({
    super.key,
  });

  final HelpSettingsController _helpSettingsController =
  Get.isRegistered<HelpSettingsController>()?
      Get.find():
  Get.put(HelpSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Privacy Policy',
              icon: ImagePath.privacyPolicy,
              action: () {},
              actionIcon: null,
            ),
            buildPrivacyPolicyContent(),
          ],
        ),
      ),
    );
  }

  buildPrivacyPolicyContent() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: Obx(() => Text(
          _helpSettingsController.privacyPolicy,
          style: TextStyles.bodySmall.copyWith(color: AppColors.semiBlack),
        ),
      ),
    );
  }
}
