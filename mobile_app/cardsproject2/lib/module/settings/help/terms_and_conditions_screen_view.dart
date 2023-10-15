import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/images_path.dart';
import '../../../util/text_styles.dart';
import '../../../view/custom_header.dart';
import 'help_settings_controller.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  TermsAndConditionsScreen({
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
              lable: 'Terms & Conditions',
              icon: ImagePath.termAndCondition,
              action: () {},
              actionIcon: null,
            ),
            buildTermsAndConditionsContent(),
          ],
        ),
      ),
    );
  }

  buildTermsAndConditionsContent() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: Obx(() => Text(
          _helpSettingsController.termsAndConditions,
          style: TextStyles.bodySmall.copyWith(color: AppColors.semiBlack),
        ),
      ),
    );
  }
}
