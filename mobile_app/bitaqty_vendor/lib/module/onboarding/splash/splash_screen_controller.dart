import 'package:get/get.dart';
import '../../../util/constants.dart';
import '../guides/onboarding_guides_screen_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    handleNavigation();
    super.onInit();
  }

  //Declerations

  //Getters

  //Logic
  handleNavigation() {
    //!TODO: Check if this is the first time using the application
    //!TODO: Check if the user already logged in
    //!TODO: Check if the user is forced to logout
    //TEMP Implementaion
    Future.delayed(AppConstants.splashScreenTimeout).then((_) {
      Get.to(
        () => const OnBoardingGuidesScreen(),
      );
    });
  }
}
