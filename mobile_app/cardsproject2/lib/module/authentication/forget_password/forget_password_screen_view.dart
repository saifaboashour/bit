import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/images_path.dart';
import '../../../util/text_styles.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/text_fields/basic_textfield.dart';
import 'forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final ForgetPasswordController _loginController =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => _loginController.isLoading ? Expanded(
              flex:1,
              child: LinearProgressIndicator(
                color: AppColors.primaryColor,
                backgroundColor: AppColors.primaryColor.withOpacity(0.5),
              ),
            ) : const SizedBox(),
            ),
            Expanded(
              flex: 100,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitleAndSubTitle(),
                    buildIllistration(),
                    buildForgetPasswordForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTitleAndSubTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Did you forget your password?",
          style: TextStyles.heading1.copyWith(
            color: AppColors.darkGrey,
          ),
        ),
        Row(
          children: [
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            Text(
              "You will receive an email with the instructions\non how to reset your password...",
              style: TextStyles.bodySmall.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  buildIllistration() {
    return SvgPicture.asset(
      ImagePath.mobileLogin,
      width: Get.width,
    );
  }

  buildForgetPasswordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Email',
              hint: 'Email',
              width: 0.9,
              controller: _loginController.emailTextFieldController,
              validator: () {},
              validationMessage: _loginController.emailErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(space: 0.02),
        Center(
          child: PrimaryButton(
            label: 'Send',
            width: 0.9,
            action: () {
              // _loginController.login();
            },
          ),
        ),
      ],
    );
  }
}
