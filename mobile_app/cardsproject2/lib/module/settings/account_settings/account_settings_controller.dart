import 'package:cardsproject2/module/settings/account_settings/account_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../service/http_client/model/general_response.dart';
import '../../../service/local_storage_manager/user_service.dart';
import '../../../util/validators/full_name_validator.dart';
import '../../../util/validators/password_validator.dart';

class AccountSettingsController extends GetxController {
  //Declarations
  //Edit Profile
  final Rx<TextEditingController> _fullNameTextFieldController =
      TextEditingController().obs;

  final RxString _fullNameErrorMessage = ''.obs;

  final RxString _selectedProfilePhotoPath = ''.obs;

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
  TextEditingController get fullNameTextFieldController =>
      _fullNameTextFieldController.value;

  String get fullNameErrorMessage => _fullNameErrorMessage.value;

  String get selectedProfilePhotoPath => _selectedProfilePhotoPath.value;

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
  @override
  onInit() {
    final userService = Get.find<UserService>();
    fullNameTextFieldController.text = userService.user.name ?? '';
    super.onInit();
  }
  //Edit Profile
  bool validateEditProfileForm() {
    bool isValid = true;

    String? validateFullName = FullNameValidator()
        .validateFirstLastName(fullNameTextFieldController.text);
    if (validateFullName != null) {
      _fullNameErrorMessage.value = validateFullName;
      isValid = false;
    }

    return isValid;
  }

  editProfiles() async{
    bool isValid = validateEditProfileForm();
    if (!isValid) {
      return;
    }

    Map<String, String> requestBody = {
      '_method': 'PUT',
      'name': fullNameTextFieldController.text,
    };

    List<http.MultipartFile> files = [];

    if(selectedProfilePhotoPath != ''){
      http.MultipartFile photo =
      await http.MultipartFile.fromPath('image', selectedProfilePhotoPath);
      files = [
        photo,
      ];
    }

    GeneralResponse<dynamic, dynamic> response = await AccountSettingsRepository()
        .updateProfileApi(requestBody, files);

    if (!response.success) {
      // showBankTransferErrorMessages(response.error);
    } else {
      final userService = Get.find<UserService>();
      userService.getUserData();
      Get.back();
    }
  }

  selectProfilePhotoPath(String? path) {
    if (path != null) {
      _selectedProfilePhotoPath.value = path;
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

  changePassword() async{
    bool isValid = validateChangePasswordForm();
    if (!isValid) {
      return;
    }

    Map<String, String> requestBody = {
      '_method': 'PUT',
      'old_password': oldPasswordTextFieldController.text,
      'new_password': newPasswordTextFieldController.text,
      'password_confirmed': confirmPasswordTextFieldController.text,
    };

    GeneralResponse<dynamic, dynamic> response = await AccountSettingsRepository()
        .updatePasswordApi(requestBody);

    if (!response.success) {
      // showBankTransferErrorMessages(response.error);
    } else {
      final userService = Get.find<UserService>();
      userService.getUserData();
      Get.back();
    }
  }

}
