import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import '../../../../util/images_path.dart';
import '../../../../view/custom_header.dart';
// import 'credit_settings_controller.dart';

class TransferCreditScreen extends StatelessWidget {
  const TransferCreditScreen({
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
            const Spacer(),
            const Text('Not Implemented Yet'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
