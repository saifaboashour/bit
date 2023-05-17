import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/images_path.dart';
import '../../../util/text_styles.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/text_fields/basic_textfield.dart';
import '../login/login_screen_view.dart';
import 'register_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleAndSubTitle(),
                  buildIllistration(),
                  buildRegisterForm(),
                  CommonWidgets().buildVerticalSpace(space: 0.05),
                  buildSwitchToLogin(),
                ],
              ),
            )),
      ),
    );
  }

  buildTitleAndSubTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Bitaqty",
          style: TextStyles.heading1.copyWith(
            color: AppColors.darkGrey,
          ),
        ),
        Row(
          children: [
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            Text(
              "Start Shopping Now...",
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
      ImagePath.mobileRegister,
      width: Get.width,
    );
  }

  buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Full Name',
              hint: 'Full Name',
              width: 0.9,
              controller: _registerController.fullNameTextFieldController,
              validator: () {},
              validationMessage: _registerController.fullNameErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Address',
              hint: 'Address',
              width: 0.9,
              controller: _registerController.addressTextFieldController,
              validator: () {},
              validationMessage: _registerController.addressErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Email',
              hint: 'Email',
              width: 0.9,
              controller: _registerController.emailTextFieldController,
              validator: () {},
              validationMessage: _registerController.emailErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Phone Number',
              hint: 'Phone Number',
              width: 0.9,
              controller: _registerController.phoneNumberTextFieldController,
              validator: () {},
              validationMessage: _registerController.phoneNumberErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Password',
              hint: 'Password',
              width: 0.9,
              controller: _registerController.passwordTextFieldController,
              validator: () {},
              validationMessage: _registerController.passwordErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Confirm Pasword',
              hint: 'Confirm Pasword',
              width: 0.9,
              controller:
                  _registerController.confirmPasswordTextFieldController,
              validator: () {},
              validationMessage:
                  _registerController.confirmPasswordErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(space: 0.02),
        Center(
          child: PrimaryButton(
            label: 'Register',
            width: 0.9,
            action: () {
              _registerController.register();
            },
          ),
        ),
      ],
    );
  }

  buildSwitchToLogin() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already have account? ',
          style: TextStyles.bodySmall.copyWith(color: AppColors.darkGrey),
          children: <TextSpan>[
            TextSpan(
              text: 'Login Now',
              style: TextStyles.bodySmall.copyWith(
                color: AppColors.primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAll(
                    () => LoginScreen(),
                    transition: Transition.noTransition,
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
