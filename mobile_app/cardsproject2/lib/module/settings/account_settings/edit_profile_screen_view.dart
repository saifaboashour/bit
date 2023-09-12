import 'package:cardsproject2/util/common_widgets.dart';
import 'package:cardsproject2/view/buttons/primary_button.dart';
import 'package:cardsproject2/view/text_fields/basic_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/images_path.dart';
import '../../../util/text_styles.dart';
import '../../../view/custom_header.dart';
import 'account_settings_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({
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
              lable: 'Edit Profile',
              icon: ImagePath.editProfile,
              action: () {},
              actionIcon: null,
            ),
            buildUserInfoCard(),
            buildEditProfileForm(),
            const Spacer(),
            buildSaveChangesButton(),
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
          const Column(
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

  buildEditProfileForm() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: BasicTextField(
        label: 'Full Name',
        hint: 'Full Name',
        controller: _accountSettingsController.fullnameTextFieldController,
        validator: () {},
        validationMessage: _accountSettingsController.fullnameErrorMessage,
        focusNode: null,
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
