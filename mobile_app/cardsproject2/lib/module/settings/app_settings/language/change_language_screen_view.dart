import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/images_path.dart';
import '../../../../view/buttons/primary_button.dart';
import '../../../../view/custom_header.dart';
import '../../../../view/text_fields/basic_dropdown.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Change Language',
              icon: ImagePath.changeLanguage,
              action: () {},
              actionIcon: null,
            ),
            buildChangeLanguageForm(),
            const Spacer(),
            buildSendButton(),
          ],
        ),
      ),
    );
  }

  buildChangeLanguageForm() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: BasicDropdown(
        hint: 'Language',
        items: const ['English', 'Arabic'],
        selectedValue: 'English',
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
