import 'dart:io';

import 'package:cardsproject2/util/app_colors.dart';
import 'package:cardsproject2/util/common_widgets.dart';
import 'package:cardsproject2/view/buttons/primary_button.dart';
import 'package:cardsproject2/view/text_fields/basic_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/files_picker/view/image_picker_dialog.dart';
import '../../../service/local_storage_manager/user_service.dart';
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
  final userService = Get.find<UserService>();

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
            CommonWidgets().buildVerticalSpace(space: 0.02),
            buildDeleteAccountButton(),
            CommonWidgets().buildVerticalSpace(space: 0.02),
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
          Obx(() =>  InkWell(
            onTap:(){
              Get.dialog(ImagePickerDialog(action: (photo) {
                _accountSettingsController.selectProfilePhotoPath(photo?.path);
                Get.back();
              }));
            },
            child: Container(
              height: Get.width * 0.25,
              width: Get.width * 0.25,
              decoration: BoxDecoration(
                color: AppColors.ligthGrey,
                borderRadius: BorderRadius.circular(Get.width * 0.01),
              ),
              child: _accountSettingsController.selectedProfilePhotoPath != '' ?
              Image.file(
                File(
                  _accountSettingsController.selectedProfilePhotoPath,
                ),
                fit: BoxFit.fill,
              )
              : Image.network(
                '${userService.user.image}',
                errorBuilder: (context,_,e) => const SizedBox(),
              ),
            ),
          ),
          ),

          CommonWidgets().buildHorizontalSpace(space: 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                  '${userService.user.commercialName}',
                  style: TextStyles.captionLarge,
                ),
              ),
              Obx(() => Text(
                  '${userService.user.email}',
                  style: TextStyles.captionSmall,
                ),
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
        controller: _accountSettingsController.fullNameTextFieldController,
        validator: () {},
        validationMessage: _accountSettingsController.fullNameErrorMessage,
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

  buildDeleteAccountButton(){
    return InkWell(
        onTap:(){

        },
        child: Text(
          'Delete Account',
          style: TextStyles.bodySmall.copyWith(
              color: AppColors.redError,
          ),
        )
    );
  }
}
