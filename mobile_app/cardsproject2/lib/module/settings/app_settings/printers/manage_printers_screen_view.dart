import 'package:cardsproject2/view/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/common_widgets.dart';
import '../../../../util/images_path.dart';
import '../../../../view/custom_header.dart';
import 'manage_printers_controller.dart';

class ManagePrintersScreen extends StatelessWidget {
  ManagePrintersScreen({
    super.key,
  });

  final ManagePrintersController _managePrintersController = Get.put(ManagePrintersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Manage Printers',
              icon: ImagePath.printer,
              action: () {},
              actionIcon: null,
            ),
            const Spacer(),
            buildScanButton(),
            CommonWidgets().buildVerticalSpace(space: 0.02),
          ],
        ),
      ),
    );
  }

  buildScanButton(){
    return PrimaryButton(
        label: 'Scan',
        width: 0.9,
        action: (){
          _managePrintersController.scanBluetoothPrinters();
        },
    );
  }
}
