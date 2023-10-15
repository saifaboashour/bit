import 'package:cardsproject2/service/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/images_path.dart';
import '../../view/custom_header.dart';
import 'notifications_controller.dart';
import 'view/notification_listitem.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({
    super.key,
  });

  final NotificationsController _notificationsController =
      Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Obx(
            () => CustomHeader(
              lable:
                  'Unread Notifications: ${_notificationsController.numberOfUnreadNotifications}',
              icon: ImagePath.notifications,
              action: () {},
              actionIcon: null,
              isBackable: false,
            ),
          ),
          buildNotificationsList(),
        ],
      ),
    );
  }

  buildNotificationsList() {
    return SizedBox(
      height: Get.height * 0.77,
      child: Obx(
        () => ListView.builder(
          itemCount: _notificationsController.notifications.length,
          itemBuilder: (context, index) => NotificationListItem(
            notification: _notificationsController.notifications[index],
            onTap: () {
              Get.toNamed(
                Routes.notificationDetails,
                arguments: _notificationsController.notifications[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
