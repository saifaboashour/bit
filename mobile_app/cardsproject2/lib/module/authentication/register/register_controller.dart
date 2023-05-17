import 'package:cardsproject2/util/validators/full_name_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/validators/email_validator.dart';
import '../../../util/validators/password_validator.dart';

class RegisterController extends GetxController {
  //Declerations
  final Rx<TextEditingController> _fullNameTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _addressTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _emailTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _phoneNumberTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _passwordTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _confirmPasswordTextFieldController =
      TextEditingController().obs;

  final RxString _fullNameErrorMessage = ''.obs;
  final RxString _addressErrorMessage = ''.obs;
  final RxString _emailErrorMessage = ''.obs;
  final RxString _phoneNumberErrorMessage = ''.obs;
  final RxString _passwordErrorMessage = ''.obs;
  final RxString _confirmPasswordErrorMessage = ''.obs;

  //Getters
  TextEditingController get fullNameTextFieldController =>
      _fullNameTextFieldController.value;
  TextEditingController get addressTextFieldController =>
      _addressTextFieldController.value;
  TextEditingController get emailTextFieldController =>
      _emailTextFieldController.value;
  TextEditingController get phoneNumberTextFieldController =>
      _phoneNumberTextFieldController.value;
  TextEditingController get passwordTextFieldController =>
      _passwordTextFieldController.value;
  TextEditingController get confirmPasswordTextFieldController =>
      _confirmPasswordTextFieldController.value;

  String get fullNameErrorMessage => _fullNameErrorMessage.value;
  String get addressErrorMessage => _addressErrorMessage.value;
  String get emailErrorMessage => _emailErrorMessage.value;
  String get phoneNumberErrorMessage => _phoneNumberErrorMessage.value;
  String get passwordErrorMessage => _passwordErrorMessage.value;
  String get confirmPasswordErrorMessage => _confirmPasswordErrorMessage.value;

  //Logic
  bool validateForm() {
    bool isValid = true;

    String? validateFullName = FullNameValidator()
        .validateFirstLastName(fullNameTextFieldController.text);
    if (validateFullName != null) {
      _fullNameErrorMessage.value = validateFullName;
      isValid = false;
    }

    //!TODO: Validate Address

    String? validateEmail =
        EmailValidator().validateEmailFormat(emailTextFieldController.text);
    if (validateEmail != null) {
      _emailErrorMessage.value = validateEmail;
      isValid = false;
    }

    //!TODO: Validate Phone Number

    String? validatePassword = PasswordValidator()
        .validatePasswordStrength(passwordTextFieldController.text);
    if (validatePassword != null) {
      _passwordErrorMessage.value = validatePassword;
      isValid = false;
    }

    String? validateConfirmPassword = PasswordValidator()
        .validateConfirmPassword(passwordTextFieldController.text,
            confirmPasswordTextFieldController.text);
    if (validateConfirmPassword != null) {
      _confirmPasswordErrorMessage.value = validateConfirmPassword;
      isValid = false;
    }

    return isValid;
  }

  register() {
    bool isValid = validateForm();
    if (!isValid) {
      return;
    }
  }
}
