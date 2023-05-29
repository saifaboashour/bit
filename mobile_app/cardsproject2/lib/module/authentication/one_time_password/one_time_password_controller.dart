import 'package:cardsproject2/module/main_container/main_container_view.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:timer_count_down/timer_controller.dart';

class OneTimePasswordController extends GetxController {
  //Declerations
  final Rx<OtpFieldController> _oneTimePasswordTextFieldController =
      OtpFieldController().obs;
  final RxDouble _reSendCountDown = (180.0).obs;
  final RxBool _isReSendAvaliable = false.obs;
  final CountdownController _countdownController =
      CountdownController(autoStart: true);

  //Getters
  OtpFieldController get oneTimePasswordTextFieldController =>
      _oneTimePasswordTextFieldController.value;
  double get reSendCountDown => _reSendCountDown.value;
  bool get isReSendAvaliable => _isReSendAvaliable.value;
  CountdownController get countdownController => _countdownController;

  //Logic
  updateReSendCountDown(double counter) {
    _reSendCountDown.value = counter;
    if (counter == 0) {
      _isReSendAvaliable.value = true;
      countdownController.pause();
    }
  }

  bool validateForm() {
    bool isValid = true;
    return isValid;
  }

  resendVerificationCode() {
    _reSendCountDown.value = (180.0);
    countdownController.restart();
  }

  verifyOtp() {
    // bool isValid = validateForm();
    // if (!isValid) {
    //   return;
    // }
    countdownController.pause();
    Get.offAll(
      () => MainContainerScreen(),
      transition: Transition.noTransition,
    );
  }
}
