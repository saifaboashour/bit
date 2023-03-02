import 'package:cardsproject2/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.heading1.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Text(
                    "Login to continue...",
                    style: TextStyles.bodySmall.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                ImagePath.mobileLogin,
                width: Get.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
