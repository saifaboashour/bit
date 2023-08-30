import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/images_path.dart';
import '../../../../view/custom_header.dart';
import 'view/credit_request_listitem.dart';

class CreditRequestHistoryScreen extends StatelessWidget {
  const CreditRequestHistoryScreen({
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
            buildCreditRequestsList(),
          ],
        ),
      ),
    );
  }

  buildCreditRequestsList() {
    return SizedBox(
      height: Get.height * 0.7,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => CreditRequestListItem(
          onTap: () {
            //Go to Credit Transfer History Screen
          },
        ),
      ),
    );
  }
}
