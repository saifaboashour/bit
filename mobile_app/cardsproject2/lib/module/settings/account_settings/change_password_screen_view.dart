import 'package:cardsproject2/util/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../util/images_path.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/custom_header.dart';
import '../../../view/text_fields/basic_textfield.dart';
import 'account_settings_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({
    super.key,
  });

  final AccountSettingsController _accountSettingsController =
      Get.put(AccountSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Change Password',
              icon: ImagePath.changePassword,
              action: () {},
              actionIcon: null,
            ),
            buildSecurityIllestration(),
            buildChangePasswordForm(),
            const Spacer(),
            buildSaveChangesButton(),
          ],
        ),
      ),
    );
  }

  buildSecurityIllestration() {
    return SvgPicture.asset(
      ImagePath.security,
    );
  }

  buildChangePasswordForm() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: Column(
        children: [
          BasicTextField(
            label: 'Current Password',
            hint: 'Current Password',
            controller:
                _accountSettingsController.oldPasswordTextFieldController,
            validator: () {},
            validationMessage:
                _accountSettingsController.oldPasswordErrorMessage,
            focusNode: null,
          ),
          CommonWidgets().buildVerticalSpace(),
          BasicTextField(
            label: 'New Password',
            hint: 'New Password',
            controller:
                _accountSettingsController.newPasswordTextFieldController,
            validator: () {},
            validationMessage:
                _accountSettingsController.newPasswordErrorMessage,
            focusNode: null,
          ),
          CommonWidgets().buildVerticalSpace(),
          BasicTextField(
            label: 'Confirm Password',
            hint: 'Confirm Password',
            controller:
                _accountSettingsController.confirmPasswordTextFieldController,
            validator: () {},
            validationMessage:
                _accountSettingsController.confirmPasswordErrorMessage,
            focusNode: null,
          ),
        ],
      ),
    );
  }

  buildSaveChangesButton() {
    return Center(
      child: PrimaryButton(
        label: 'Save',
        width: 0.9,
        action: () {
          _accountSettingsController.editProfiles();
        },
      ),
    );
  }
}
