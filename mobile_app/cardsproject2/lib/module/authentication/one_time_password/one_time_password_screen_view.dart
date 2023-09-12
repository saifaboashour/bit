import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/images_path.dart';
import '../../../util/text_styles.dart';
import '../../../util/validators/formatters/time_formmaters.dart';
import '../../../view/buttons/primary_button.dart';
import 'one_time_password_controller.dart';

class OneTimePasswordScreen extends StatelessWidget {
  OneTimePasswordScreen({Key? key}) : super(key: key);

  final OneTimePasswordController _oneTimePasswordController =
      Get.put(OneTimePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitleAndSubTitle(),
              buildIllistration(),
              buildOneTimePasswordForm(),
            ],
          ),
        ),
      ),
    );
  }

  buildTitleAndSubTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Verification ",
          style: TextStyles.heading1.copyWith(
            color: AppColors.darkGrey,
          ),
        ),
        Row(
          children: [
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            Text(
              "One more step...",
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
      ImagePath.oneTimePassword,
      width: Get.width,
    );
  }

  buildOneTimePasswordForm() {
    return Column(
      children: [
        Center(
          child: OTPTextField(
            length: 5,
            width: Get.width * 0.75,
            fieldWidth: Get.width * 0.12,
            style: TextStyles.bodyLarge,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            controller:
                _oneTimePasswordController.oneTimePasswordTextFieldController,
            otpFieldStyle: OtpFieldStyle(
              focusBorderColor: AppColors.primaryColor,
              enabledBorderColor: AppColors.darkGrey,
            ),
            onCompleted: (pin) {
              log("Completed: $pin");
            },
            onChanged: (pin) {},
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Text(
          'Please check your Inbox/Spam for verification code',
          style: TextStyles.captionLarge.copyWith(color: AppColors.darkGrey),
        ),
        CommonWidgets().buildVerticalSpace(space: 0.02),
        Obx(
          () => _oneTimePasswordController.isReSendAvaliable
              ? InkWell(
                  onTap: () {
                    _oneTimePasswordController.resendVerificationCode();
                  },
                  child: Text(
                    'Resend',
                    style: TextStyles.bodySmall.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : Countdown(
                  seconds: 180,
                  controller: _oneTimePasswordController.countdownController,
                  build: (BuildContext context, double time) {
                    _oneTimePasswordController.updateReSendCountDown(time);
                    return Text(
                      TimeFormmaters().formatDurationToTime(time),
                      style: TextStyles.bodySmall.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    );
                  },
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    log('Timer is done!');
                  },
                ),
        ),
        CommonWidgets().buildVerticalSpace(space: 0.05),
        buildVerifyButton(),
        CommonWidgets().buildVerticalSpace(space: 0.05),
      ],
    );
  }

  buildVerifyButton() {
    return Center(
      child: PrimaryButton(
        label: 'Send',
        width: 0.9,
        action: () {
          _oneTimePasswordController.verifyOtp();
        },
      ),
    );
  }
}
