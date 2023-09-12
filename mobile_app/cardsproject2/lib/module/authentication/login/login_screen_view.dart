import 'package:cardsproject2/module/authentication/login/login_controller.dart';
import 'package:cardsproject2/util/images_path.dart';
import 'package:cardsproject2/view/text_fields/basic_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/text_styles.dart';
import '../../../view/buttons/primary_button.dart';
import '../forget_password/forget_password_screen_view.dart';
import '../register/register_screen_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets().buildVerticalSpace(space: 0.02),
              buildTitleAndSubTitle(),
              buildIllistration(),
              buildLoginForm(),
              const Spacer(),
              buildSwitchToRegister(),
              CommonWidgets().buildVerticalSpace(space: 0.05),
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
          "Welcome Back",
          style: TextStyles.heading1.copyWith(
            color: AppColors.darkGrey,
          ),
        ),
        Row(
          children: [
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            Text(
              "Login to continue...",
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

  buildLoginForm() {
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
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Password',
              hint: 'Password',
              width: 0.9,
              controller: _loginController.passwordTextFieldController,
              validator: () {},
              validationMessage: _loginController.passwordErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(space: 0.02),
        Center(
          child: PrimaryButton(
            label: 'Login',
            width: 0.9,
            action: () {
              _loginController.login();
            },
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        InkWell(
          onTap: () {
            Get.to(
              () => ForgetPasswordScreen(),
              transition: Transition.noTransition,
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Text(
              'Forget Password?',
              style: TextStyles.bodySmall.copyWith(color: AppColors.darkGrey),
            ),
          ),
        ),
      ],
    );
  }

  buildSwitchToRegister() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'New User? ',
          style: TextStyles.bodySmall.copyWith(color: AppColors.darkGrey),
          children: <TextSpan>[
            TextSpan(
              text: 'Register',
              style: TextStyles.bodySmall.copyWith(
                color: AppColors.primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAll(
                    () => RegisterScreen(),
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
