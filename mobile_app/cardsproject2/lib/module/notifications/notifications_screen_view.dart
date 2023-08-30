import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/images_path.dart';
import '../../view/custom_header.dart';
import 'notification_details_screen_view.dart';
// import 'notifications_controller.dart';
import 'view/notification_listitem.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({
    super.key,
  });

  // final NotificationsController _notificationsController =
  //     Get.put(NotificationsController());

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
            isBackable: false,
          ),
          buildNotificationsList(),
        ],
      ),
    );
  }

  buildNotificationsList() {
    return SizedBox(
      height: Get.height * 0.7,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => NotificationListItem(
          onTap: () {
            Get.to(
              () => const NotificationDetailsScreen(),
              transition: Transition.noTransition,
            );
          },
        ),
      ),
    );
  }
}
