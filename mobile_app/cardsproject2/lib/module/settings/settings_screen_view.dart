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
        ],
      ),
    );
  }
}
