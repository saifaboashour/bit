import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../service/files_picker/view/image_picker_dialog.dart';
import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/images_path.dart';
import '../../../util/text_styles.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/custom_header.dart';
import '../../../view/text_fields/basic_dropdown.dart';
import '../../../view/text_fields/basic_textfield.dart';
import 'help_settings_controller.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({
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
              lable: 'Support',
              icon: ImagePath.support,
              action: () {},
              actionIcon: null,
            ),
            buildSupportForm(),
            buildIssueImage(),
            const Spacer(),
            buildSendButton(),
            CommonWidgets().buildVerticalSpace(space: 0.02),
          ],
        ),
      ),
    );
  }

  buildSupportForm() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: Column(
        children: [
          Obx(
                () => BasicDropdown(
              hint: 'Transfer Type',
              items: _helpSettingsController.issueTypes
                  .map((supportedAccount) => supportedAccount.name ?? '')
                  .toList(),
              selectedValue: _helpSettingsController.selectedIssueType,
              onChange:
              _helpSettingsController.changeSelectedIssueType,
            ),
          ),
          CommonWidgets().buildVerticalSpace(),
          BasicTextField(
            label: 'Notes',
            hint: 'Notes',
            maxLines: 6,
            controller: _helpSettingsController.notesTextFieldController,
            validator: () {},
            validationMessage: _helpSettingsController.notesErrorMessage,
            focusNode: null,
          ),
        ],
      ),
    );
  }

  buildIssueImage() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Issue Image',
            style:
            TextStyles.captionLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          CommonWidgets().buildVerticalSpace(),
          InkWell(
            onTap: () {
              Get.dialog(ImagePickerDialog(action: (photo) {
                _helpSettingsController.selectIssuePhotoPath(photo?.path);
                Get.back();
              }));
            },
            child: Container(
              height: Get.height * 0.2,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: AppColors.ligthGrey,
                borderRadius: BorderRadius.circular(Get.width * 0.01),
                border: Border.all(color: AppColors.darkGrey),
              ),
              child: Obx(
                    () => _helpSettingsController.selectedIssuePhotoPath != ''
                    ? Image.file(
                  File(
                    _helpSettingsController.selectedIssuePhotoPath,
                  ),
                  fit: BoxFit.fill,
                )
                    : Center(
                  child: SvgPicture.asset(
                    ImagePath.plus,
                    color: AppColors.darkGrey,
                    height: Get.height * 0.05,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildSendButton() {
    return Center(
      child: PrimaryButton(
        label: 'Submit',
        width: 0.9,
        action: () {
          _helpSettingsController.reportIssue();
        },
      ),
    );
  }
}
