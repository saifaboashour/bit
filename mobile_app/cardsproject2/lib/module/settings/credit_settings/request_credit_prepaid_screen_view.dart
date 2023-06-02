import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/images_path.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/custom_header.dart';
import '../../../view/text_fields/basic_textfield.dart';
import 'credit_settings_controller.dart';

class RequestCreditPrepaidScreen extends StatelessWidget {
  RequestCreditPrepaidScreen({
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
            buildCreditRequestPrepaidForm(),
            const Spacer(),
            buildSaveChangesButton(),
          ],
        ),
      ),
    );
  }

  buildCreditRequestPrepaidForm() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: BasicTextField(
        label: 'Card Number',
        hint: 'Card Number',
        controller: _creditSettingsController.cardNumberTextFieldController,
        validator: () {},
        validationMessage: _creditSettingsController.cardNumberErrorMessage,
        focusNode: null,
      ),
    );
  }

  buildSaveChangesButton() {
    return Center(
      child: PrimaryButton(
        label: 'Submit',
        width: 0.9,
        action: () {},
      ),
    );
  }
}
