import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/images_path.dart';
import '../../../../view/buttons/primary_button.dart';
import '../../../../view/custom_header.dart';
import '../../../../view/text_fields/basic_dropdown.dart';

class ChangeCurrencyScreen extends StatelessWidget {
  const ChangeCurrencyScreen({
    super.key,
  });

  // final CreditSettingsController _creditSettingsController = Get.find();

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
            buildChangeCurrencyForm(),
            const Spacer(),
            buildSendButton(),
          ],
        ),
      ),
    );
  }

  buildChangeCurrencyForm() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: BasicDropdown(
        hint: 'Currency',
        items: const ['USD', 'JOD'],
        selectedValue: 'USD',
        onChange: (value) {},
      ),
    );
  }

  buildSendButton() {
    return Center(
      child: PrimaryButton(
        label: 'Save',
        width: 0.9,
        action: () {},
      ),
    );
  }
}
