import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../service/files_picker/view/image_picker_dialog.dart';
import '../../../../service/local_storage_manager/user_service.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/common_widgets.dart';
import '../../../../util/images_path.dart';
import '../../../../util/text_styles.dart';
import '../../../../view/buttons/primary_button.dart';
import '../../../../view/custom_header.dart';
import '../../../../view/text_fields/basic_dropdown.dart';
import '../../../../view/text_fields/basic_textfield.dart';
import 'credit_settings_controller.dart';

class RequestCreditBankTransferScreen extends StatelessWidget {
  RequestCreditBankTransferScreen({
    super.key,
  });

  final CreditSettingsController _creditSettingsController =
      Get.isRegistered<CreditSettingsController>()
          ? Get.find()
          : Get.put(CreditSettingsController());
  final userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => CustomHeader(
                lable:
                    '${userService.user.credit} ${userService.user.currency?.symbol}',
                icon: ImagePath.wallet,
                action: () {},
                actionIcon: null,
              ),
            ),
            buildCreditRequestBankTransferForm(),
            buildTransferImage(),
            const Spacer(),
            buildSendButton(),
            CommonWidgets().buildVerticalSpace(space: 0.02),
          ],
        ),
      ),
    );
  }

  buildCreditRequestBankTransferForm() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: Column(
        children: [
          BasicTextField(
            label: 'Amount',
            hint: 'Amount',
            controller: _creditSettingsController.amountTextFieldController,
            validator: () {},
            validationMessage: _creditSettingsController.amountErrorMessage,
            focusNode: null,
          ),
          CommonWidgets().buildVerticalSpace(),
          Obx(
            () => BasicDropdown(
              hint: 'Transfer Type',
              items: _creditSettingsController.supportedAccounts
                  .map((supportedAccount) => supportedAccount.name ?? '')
                  .toList(),
              selectedValue: _creditSettingsController.selectedSupportedAccount,
              onChange:
                  _creditSettingsController.changeSelectedSupportedAccount,
            ),
          ),
          CommonWidgets().buildVerticalSpace(),
          BasicTextField(
            label: 'Notes',
            hint: 'Notes',
            controller: _creditSettingsController.notesTextFieldController,
            validator: () {},
            validationMessage: _creditSettingsController.notesErrorMessage,
            focusNode: null,
          ),
        ],
      ),
    );
  }

  buildTransferImage() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credit Transfer',
            style:
                TextStyles.captionLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          CommonWidgets().buildVerticalSpace(),
          InkWell(
            onTap: () {
              Get.dialog(ImagePickerDialog(action: (photo) {
                _creditSettingsController.selectTransferPhotoPath(photo?.path);
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
                () => _creditSettingsController.selectedTransferPhotoPath != ''
                    ? Image.file(
                        File(
                          _creditSettingsController.selectedTransferPhotoPath,
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
          _creditSettingsController.requestCreditBankTransfer();
        },
      ),
    );
  }
}
