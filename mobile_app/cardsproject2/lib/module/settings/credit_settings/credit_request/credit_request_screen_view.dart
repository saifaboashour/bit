import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../service/local_storage_manager/user_service.dart';
import '../../../../service/navigation/routes.dart';
import '../../../../util/images_path.dart';
import '../../../../util/text_styles.dart';
import '../../../../view/custom_header.dart';
import '../../view/settings_button.dart';
import 'credit_settings_controller.dart';
import 'request_credit_qr_code_screen_view.dart';
import 'transfer_credit_screen_view.dart';

class RequestCreditScreen extends StatelessWidget {
  RequestCreditScreen({
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
            buildPaymentMethodsSection(),
            Obx(
              () => (userService.user.canGiveCredit == "1")
                  ? buildSendCreditSection()
                  : const SizedBox(),
            ),
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
              Get.toNamed(Routes.requestCreditBankTransfer);
            },
          ),
          SettingsButton(
            title: 'Prepaid Card',
            icon: ImagePath.prepaid,
            onTap: () {
              Get.toNamed(Routes.requestCreditPrepaid);
            },
          ),
          SettingsButton(
            title: 'QR Code',
            icon: ImagePath.qrScan,
            onTap: () {
              Get.to(() => BarcodeScannerWithScanWindow() , transition: Transition.noTransition,);
              //Get.toNamed(Routes.requestCreditQRCode);
            },
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
