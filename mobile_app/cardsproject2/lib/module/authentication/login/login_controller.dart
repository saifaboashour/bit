import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/http_client/model/general_response.dart';
import '../../../service/http_client/model/http_error.dart';
import '../../../util/engagment/snackbars.dart';
import '../../../util/validators/email_validator.dart';
import '../../../util/validators/password_validator.dart';
import '../one_time_password/one_time_password_screen_view.dart';
import 'login_repository.dart';
import 'model/login_error.dart';
import 'model/login_response.dart';

class LoginController extends GetxController {
  //Declerations
  final Rx<TextEditingController> _emailTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _passwordTextFieldController =
      TextEditingController().obs;

  final RxString _emailErrorMessage = ''.obs;
  final RxString _passwordErrorMessage = ''.obs;

  //Getters
  TextEditingController get emailTextFieldController =>
      _emailTextFieldController.value;
  TextEditingController get passwordTextFieldController =>
      _passwordTextFieldController.value;

  String get emailErrorMessage => _emailErrorMessage.value;
  String get passwordErrorMessage => _passwordErrorMessage.value;

  //Logic
  resetErrorMessages() {
    _emailErrorMessage.value = '';
    _passwordErrorMessage.value = '';
  }

  bool validateForm() {
    bool isValid = true;
    resetErrorMessages();

    String? validateEmail =
        EmailValidator().validateEmailFormat(emailTextFieldController.text);
    if (validateEmail != null) {
      _emailErrorMessage.value = validateEmail;
      isValid = false;
    }

    String? validatePassword = PasswordValidator()
        .validatePasswordStrength(passwordTextFieldController.text);
    if (validatePassword != null) {
      _passwordErrorMessage.value = validatePassword;
      isValid = false;
    }
    return isValid;
  }

  showErrorMessages(HttpError<LoginError>? errors) {
    _emailErrorMessage.value = errors?.details?.email ?? '';
    _passwordErrorMessage.value = errors?.details?.password ?? '';

    AppSnackBars.showError('${errors?.message}');
  }

  login() async {
    bool isValid = validateForm();
    if (!isValid) {
      return;
    }

    Map<String, String> requestBody = {
      'username': emailTextFieldController.text,
      'password': passwordTextFieldController.text,
      'fcm_token': 'Test FCM Token',
    };

    GeneralResponse<LoginResponse, LoginError> response =
        await LoginRepository().loginApi(requestBody);

    log('Response => ${response.success}');
    if (!response.success) {
      showErrorMessages(response.error);
    } else {
      //TODO: Pass Otp Token to OTP Screen
      log('Otp Token => ${response.data?.otpToken}');
      Get.to(
        () => OneTimePasswordScreen(),
        transition: Transition.noTransition,
      );
    }
  }
}
