import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../service/local_storage_manager/user_service.dart';
import '../../../../util/images_path.dart';
import '../../../../view/custom_header.dart';
import 'credit_request_history_controller.dart';
import 'view/credit_request_listitem.dart';

class CreditRequestHistoryScreen extends StatelessWidget {
  CreditRequestHistoryScreen({
    super.key,
  });

  final CreditRequestHistoryController _creditHistoryController = Get.put(CreditRequestHistoryController());
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
            buildCreditRequestsList(),
          ],
        ),
      ),
    );
  }

  buildCreditRequestsList() {
    return SizedBox(
      height: Get.height * 0.7,
      child: Obx(() => ListView.builder(
          itemCount: _creditHistoryController.creditTransactions.length,
          itemBuilder: (context, index) => CreditRequestListItem(
            creditTransaction: _creditHistoryController.creditTransactions[index],
            onTap: () {
              //TODO: Go to Credit Transfer History Screen
            },
          ),
        ),
      ),
    );
  }
}
