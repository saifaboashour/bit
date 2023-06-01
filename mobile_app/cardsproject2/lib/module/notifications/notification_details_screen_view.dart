import 'package:cardsproject2/util/common_widgets.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/images_path.dart';
import '../../view/custom_header.dart';
import 'notifications_controller.dart';

class NotificationDetailsScreen extends StatelessWidget {
  NotificationDetailsScreen({
    super.key,
  });

  final NotificationsController _notificationsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Notification Details',
              icon: ImagePath.notifications,
              action: () {},
              actionIcon: null,
            ),
            buildNotificationDetails(),
          ],
        ),
      ),
    );
  }

  buildNotificationDetails() {
    return SizedBox(
      height: Get.height * 0.75,
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.2,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(Get.width * 0.01),
              ),
            ),
            CommonWidgets().buildVerticalSpace(space: 0.02),
            Text(
              'Welcome !',
              style: TextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Welcome to Bitaqty, Feel free to contact us anytime we willbe happy to provide the help you need in order to grow your business with us.',
              style: TextStyles.captionLarge,
            ),
          ],
        ),
      ),
    );
  }
}
