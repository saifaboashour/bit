import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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

  final CreditSettingsController _creditSettingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: '98.05 USD',
              icon: ImagePath.wallet,
              action: () {},
              actionIcon: null,
            ),
            buildCreditRequestBankTransferForm(),
            buildTransferImage(),
            const Spacer(),
            buildSendButton(),
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
          BasicDropdown(
            hint: 'Transfer Type',
            items: const ['Acount Number 4985765', 'Acount Number 434636'],
            selectedValue: 'Acount Number 4985765',
            onChange: (value) {},
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
          Container(
            height: Get.height * 0.2,
            width: Get.width * 0.9,
            decoration: BoxDecoration(
              color: AppColors.ligthGrey,
              borderRadius: BorderRadius.circular(Get.width * 0.01),
            ),
            child: Center(
              child: SvgPicture.asset(
                ImagePath.plus,
                color: AppColors.darkGrey,
                height: Get.height * 0.05,
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
        action: () {},
      ),
    );
  }
}
