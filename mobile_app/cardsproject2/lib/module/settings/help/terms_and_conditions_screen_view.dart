import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/images_path.dart';
import '../../../util/text_styles.dart';
import '../../../view/custom_header.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Terms & Conditions',
              icon: ImagePath.termAndCondition,
              action: () {},
              actionIcon: null,
            ),
            buildTermsAndConditionsContent(),
          ],
        ),
      ),
    );
  }

  buildTermsAndConditionsContent() {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.04),
      child: Text(
        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
        style: TextStyles.bodySmall.copyWith(color: AppColors.semiBlack),
      ),
    );
  }
}
