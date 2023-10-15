import 'package:cardsproject2/util/formatters/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/text_styles.dart';
import '../model/notification.dart' as model;

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final model.Notification notification;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.01,
        vertical: Get.height * 0.005,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(Get.width * 0.02),
            boxShadow: [
              BoxShadow(
                color: AppColors.ligthGrey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.01),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: Get.width * 0.2,
                  width: Get.width * 0.2,
                  decoration: BoxDecoration(
                    color: AppColors.ligthGrey,
                    borderRadius: BorderRadius.circular(Get.width * 0.01),
                  ),
                  child: Image.network(
                    notification.image ?? '',
                    errorBuilder: (context, error, stackTrace) => Center(
                        child: Text(
                      '404',
                      style: TextStyles.captionLarge
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                CommonWidgets().buildHorizontalSpace(space: 0.02),
                SizedBox(
                  height: Get.height * 0.07,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title ?? '-',
                        style: TextStyles.captionLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        notification.description ?? '-',
                        style: TextStyles.captionLarge,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: Get.height * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: Get.width * 0.02,
                        width: Get.width * 0.02,
                        decoration: BoxDecoration(
                          color: (notification.isRead ?? false)
                              ? Colors.transparent
                              : AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(Get.width * 0.02),
                        ),
                      ),
                      Text(
                        DateHelper().formatDateDMY(notification.createdAt),
                        style: TextStyles.captionLarge
                            .copyWith(color: AppColors.darkGrey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
