import 'package:cardsproject2/util/validators/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  //Declerations
  final Rx<TextEditingController> _emailTextFieldController =
      TextEditingController().obs;

  final RxString _emailErrorMessage = ''.obs;

  //Getters
  TextEditingController get emailTextFieldController =>
      _emailTextFieldController.value;

  String get emailErrorMessage => _emailErrorMessage.value;

  //Logic
  bool validateForm() {
    bool isValid = true;

    String? validateEmail =
        EmailValidator().validateEmailFormat(emailTextFieldController.text);
    if (validateEmail != null) {
      _emailErrorMessage.value = validateEmail;
      isValid = false;
    }

    return isValid;
  }

  forgetPassword() {
    bool isValid = validateForm();
    if (!isValid) {
      return;
    }
  }
}
