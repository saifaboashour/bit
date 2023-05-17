import 'package:cardsproject2/module/authentication/login/login_screen_view.dart';
import 'package:cardsproject2/util/app_colors.dart';
import 'package:cardsproject2/util/images_path.dart';
import 'package:cardsproject2/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../authentication/register/register_screen_view.dart';
import 'view/slider_page_body.dart';

class OnBoardingGuidesScreen extends StatelessWidget {
  const OnBoardingGuidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OnBoardingSlider(
          headerBackgroundColor: Colors.transparent,
          finishButtonText: 'Register',
          onFinish: () {
            Get.offAll(
              () => RegisterScreen(),
              transition: Transition.noTransition,
            );
          },
          finishButtonTextStyle:
              TextStyles.bodyLarge.copyWith(color: Colors.white),
          skipTextButton: Text(
            'Skip',
            style: TextStyles.bodySmall.copyWith(color: AppColors.darkGrey),
          ),
          trailing: Text(
            'Login',
            style: TextStyles.bodySmall.copyWith(color: AppColors.darkGrey),
          ),
          trailingFunction: () {
            Get.offAll(
              () => LoginScreen(),
              transition: Transition.noTransition,
            );
          },
          controllerColor: AppColors.primaryColor,
          finishButtonColor: AppColors.primaryColor,
          background: [
            SvgPicture.asset(
              ImagePath.onlineGames,
              width: Get.width,
            ),
            SvgPicture.asset(
              ImagePath.instructionManual,
              width: Get.width,
            ),
            SvgPicture.asset(
              ImagePath.acceptTerms,
              width: Get.width,
            ),
          ],
          totalPage: 3,
          speed: 1.8,
          pageBodies: const [
            SliderPageBody(
              title: 'Bitaqty',
              description: 'You Can Now Recharge Games in a Fast and Easy Way.',
            ),
            SliderPageBody(
              title: 'How To Use',
              description:
                  'Please Register With Your Real Information So We Can Avoid Any Issues in the Future.',
            ),
            SliderPageBody(
              title: 'Terms & Conditions',
              description:
                  'You Are The Only Responsible for any misuse of the Application.',
            ),
          ],
        ),
      ),
    );
  }
}
