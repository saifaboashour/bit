import 'dart:developer';

import 'package:cardsproject2/module/authentication/one_time_password/model/otp_error.dart';
import 'package:cardsproject2/module/authentication/one_time_password/model/otp_reponse.dart';
import 'package:cardsproject2/service/local_storage_manager/local_storage_manager_app.dart';
import 'package:cardsproject2/service/navigation/routes.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../../service/http_client/model/general_response.dart';
import '../../../service/http_client/model/http_error.dart';
import '../../../util/engagment/snackbars.dart';
import 'one_time_password_repositor.dart';

class OneTimePasswordController extends GetxController {
  @override
  void onInit() {
    if (Get.parameters['token'] != null) {
      _token = Get.parameters['token'] ?? '';
    }
    super.onInit();
  }

  //Declerations
  final Rx<OtpFieldController> _oneTimePasswordTextFieldController =
      OtpFieldController().obs;
  final RxDouble _reSendCountDown = (180.0).obs;
  final RxBool _isReSendAvaliable = false.obs;
  final CountdownController _countdownController =
      CountdownController(autoStart: true);
  final RxBool _otpHasError = false.obs;

  final RxString _otpCode = ''.obs;
  String _token = '';

  //Getters
  OtpFieldController get oneTimePasswordTextFieldController =>
      _oneTimePasswordTextFieldController.value;
  double get reSendCountDown => _reSendCountDown.value;
  bool get isReSendAvaliable => _isReSendAvaliable.value;
  CountdownController get countdownController => _countdownController;
  bool get otpHasError => _otpHasError.value;

  String get otpCode => _otpCode.value;

  //Logic
  updateReSendCountDown(double counter) {
    _reSendCountDown.value = counter;
    if (counter == 0) {
      _isReSendAvaliable.value = true;
      countdownController.pause();
    }
  }

  updateOtpCodeValue(String code) {
    _otpCode.value = code;
  }

  bool validateForm() {
    bool isValid = true;
    resetErrorMessages();

    if (otpCode.isEmpty) {
      isValid = false;
    }
    if (_token.isEmpty) {
      isValid = false;
    }
    return isValid;
  }

  resetErrorMessages() {
    _otpHasError.value = false;
  }

  showErrorMessages(HttpError<OtpError>? errors) {
    _otpHasError.value = true;

    AppSnackBars.showError('${errors?.message}');
  }

  resendVerificationCode() {
    _reSendCountDown.value = (180.0);
    countdownController.restart();
  }

  verifyOtp() async {
    bool isValid = validateForm();
    if (!isValid) {
      return;
    }
    countdownController.pause();

    Map<String, String> requestBody = {
      'otp_token': _token,
      'code': otpCode,
    };

    GeneralResponse<OtpResponse, OtpError> response =
        await OneTimePasswordRepository().verifyOtpApi(requestBody);

    log('Response => ${response.success}');
    if (!response.success) {
      showErrorMessages(response.error);
    } else {
      final LocalStorageManagerApp localStorageManagerApp =
          LocalStorageManagerApp();
      await localStorageManagerApp.saveUserTokens(response.data);
      Get.offAllNamed(Routes.home);
    }
  }
}
