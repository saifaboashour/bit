import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../service/local_storage_manager/user_service.dart';
import '../../../../util/common_widgets.dart';
import '../../../../util/images_path.dart';
import '../../../../view/buttons/primary_button.dart';
import '../../../../view/custom_header.dart';
import '../../../../view/text_fields/basic_dropdown.dart';
import '../credit_request/credit_settings_controller.dart';

class ChangeCurrencyScreen extends StatelessWidget {
  ChangeCurrencyScreen({
    super.key,
  });

  final CreditSettingsController _creditSettingsController =
  Get.put(CreditSettingsController());
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
            buildChangeCurrencyForm(),
            const Spacer(),
            buildSendButton(),
            CommonWidgets().buildVerticalSpace(space: 0.02),
          ],
        ),
      ),
    );
  }

  buildChangeCurrencyForm() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: Obx(() => BasicDropdown(
          hint: 'Currency',
          items: _creditSettingsController.currencies.map((currency) => currency.name ?? 'Loading...').toList() ?? ['Loading...'],
          selectedValue: _creditSettingsController.selectedCurrency,
          onChange: _creditSettingsController.changeSelectedCurrency,
        ),
      ),
    );
  }

  buildSendButton() {
    return Center(
      child: PrimaryButton(
        label: 'Save',
        width: 0.9,
        action: () {
          _creditSettingsController.changeCurrency();
        },
      ),
    );
  }
}
