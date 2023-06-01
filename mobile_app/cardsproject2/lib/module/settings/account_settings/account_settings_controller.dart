import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/validators/full_name_validator.dart';
import '../../../util/validators/password_validator.dart';

class AccountSettingsController extends GetxController {
  //Declerations
  //Edit Profile
  final Rx<TextEditingController> _fullnameTextFieldController =
      TextEditingController().obs;

  final RxString _fullnameErrorMessage = ''.obs;
  //Change Password
  final Rx<TextEditingController> _oldPasswordTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _newPasswordTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _confirmPasswordTextFieldController =
      TextEditingController().obs;

  final RxString _oldPasswordErrorMessage = ''.obs;
  final RxString _newPasswordErrorMessage = ''.obs;
  final RxString _confirmPasswordErrorMessage = ''.obs;

  //Getters
  //Edit Profile
  TextEditingController get fullnameTextFieldController =>
      _fullnameTextFieldController.value;

  String get fullnameErrorMessage => _fullnameErrorMessage.value;

  //Change Password
  TextEditingController get oldPasswordTextFieldController =>
      _oldPasswordTextFieldController.value;
  TextEditingController get newPasswordTextFieldController =>
      _newPasswordTextFieldController.value;
  TextEditingController get confirmPasswordTextFieldController =>
      _confirmPasswordTextFieldController.value;

  String get oldPasswordErrorMessage => _oldPasswordErrorMessage.value;
  String get newPasswordErrorMessage => _newPasswordErrorMessage.value;
  String get confirmPasswordErrorMessage => _confirmPasswordErrorMessage.value;

  //Logic
  //Edit Profile
  bool validateEditProfileForm() {
    bool isValid = true;

    String? validateFullName = FullNameValidator()
        .validateFirstLastName(fullnameTextFieldController.text);
    if (validateFullName != null) {
      _fullnameErrorMessage.value = validateFullName;
      isValid = false;
    }

    return isValid;
  }

  editProfiles() {
    bool isValid = validateEditProfileForm();
    if (!isValid) {
      return;
    }
  }

  //Change Password
  bool validateChangePasswordForm() {
    bool isValid = true;

    String? validatePassword = PasswordValidator()
        .validatePasswordStrength(oldPasswordTextFieldController.text);
    if (validatePassword != null) {
      _oldPasswordErrorMessage.value = validatePassword;
      isValid = false;
    }

    String? validateConfirmPassword = PasswordValidator()
        .validateConfirmPassword(newPasswordTextFieldController.text,
            confirmPasswordTextFieldController.text);
    if (validateConfirmPassword != null) {
      _confirmPasswordErrorMessage.value = validateConfirmPassword;
      isValid = false;
    }

    return isValid;
  }

  changePassowrd() {
    bool isValid = validateChangePasswordForm();
    if (!isValid) {
      return;
    }
  }
}
