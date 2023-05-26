import 'package:cardsproject2/module/main_container/main_container_view.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';

class OneTimePasswordController extends GetxController {
  //Declerations
  final Rx<OtpFieldController> _oneTimePasswordTextFieldController =
      OtpFieldController().obs;
  final RxDouble _reSendCountDown = (180.0).obs;
  final RxBool _isReSendAvaliable = false.obs;

  //Getters
  OtpFieldController get oneTimePasswordTextFieldController =>
      _oneTimePasswordTextFieldController.value;
  double get reSendCountDown => _reSendCountDown.value;
  bool get isReSendAvaliable => _isReSendAvaliable.value;

  //Logic
  updateReSendCountDown(double counter) {
    _reSendCountDown.value = counter;
    if (counter == 0) {
      _isReSendAvaliable.value = true;
    }
  }

  bool validateForm() {
    bool isValid = true;
    return isValid;
  }

  resendVerificationCode() {}

  verifyOtp() {
    // bool isValid = validateForm();
    // if (!isValid) {
    //   return;
    // }
    Get.to(
      () => MainContainerScreen(),
      transition: Transition.noTransition,
    );
  }
}
