import 'package:cardsproject2/module/authentication/one_time_password/one_time_password_screen_view.dart';
import 'package:cardsproject2/util/validators/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/validators/password_validator.dart';

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
  bool validateForm() {
    bool isValid = true;

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

  login() {
    // bool isValid = validateForm();
    // if (!isValid) {
    //   return;
    // }
    Get.to(
      () => OneTimePasswordScreen(),
      transition: Transition.noTransition,
    );
  }
}
