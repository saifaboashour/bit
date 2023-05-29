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
          CustomHeader(
            lable: 'Unread Notifications: 1',
            icon: ImagePath.notifications,
            action: () {},
            actionIcon: null,
          ),
          buildOrdersList(),
        ],
      ),
    );
  }

  buildOrdersList() {
    return SizedBox(
      height: Get.height * 0.7,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => NotificationListItem(),
      ),
    );
  }
}
