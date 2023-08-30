import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../util/images_path.dart';
import '../../../../util/text_styles.dart';
import '../../../../view/custom_header.dart';
import '../../view/settings_button.dart';
// import 'credit_settings_controller.dart';
import 'request_credit_bank_transfer_screen_view.dart';
import 'request_credit_prepaid_screen_view.dart';
import 'transfer_credit_screen_view.dart';

class RequestCreditScreen extends StatelessWidget {
  const RequestCreditScreen({
    super.key,
  });

  // final CreditSettingsController _creditSettingsController =
  //     Get.put(CreditSettingsController());

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
            buildPaymentMethodsSection(),
            buildSendCreditSection(),
          ],
        ),
      ),
    );
  }

  buildPaymentMethodsSection() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Methods',
            style:
                TextStyles.captionLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          SettingsButton(
            title: 'Bank Transfer',
            icon: ImagePath.bankTransfer,
            onTap: () {
              Get.to(
                RequestCreditBankTransferScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
          SettingsButton(
            title: 'Prepaid Card',
            icon: ImagePath.prepaid,
            onTap: () {
              Get.to(
                () => RequestCreditPrepaidScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
          SettingsButton(
            title: 'QR Code',
            icon: ImagePath.qrScan,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  buildSendCreditSection() {
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
          SettingsButton(
            title: 'Send Credit',
            icon: ImagePath.sendCredit,
            onTap: () {
              Get.to(
                () => const TransferCreditScreen(),
                transition: Transition.noTransition,
              );
            },
          ),
        ],
      ),
    );
  }
}
