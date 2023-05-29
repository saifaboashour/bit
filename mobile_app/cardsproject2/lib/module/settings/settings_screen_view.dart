import 'package:cardsproject2/util/common_widgets.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/images_path.dart';
import '../../view/custom_header.dart';
import 'settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({
    super.key,
  });

  final SettingsController _settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomHeader(
            lable: 'Settings',
            icon: ImagePath.settings,
            action: () {},
            actionIcon: null,
          ),
          buildUserInfoCard(),
        ],
      ),
    );
  }

  buildUserInfoCard() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Row(
        children: [
          Container(
            height: Get.width * 0.25,
            width: Get.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(Get.width * 0.01),
            ),
          ),
          CommonWidgets().buildHorizontalSpace(space: 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bitaqty Store',
                style: TextStyles.captionLarge,
              ),
              Text(
                'saifaboashour@bitaqty.com',
                style: TextStyles.captionSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
