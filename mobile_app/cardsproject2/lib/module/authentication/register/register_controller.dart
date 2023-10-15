import 'package:cardsproject2/module/authentication/authentication_repository.dart';
import 'package:cardsproject2/module/authentication/model/countries_response.dart';
import 'package:cardsproject2/module/authentication/register/model/register_error.dart';
import 'package:cardsproject2/module/authentication/register/register_repository.dart';
import 'package:cardsproject2/util/validators/full_name_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/http_client/model/general_response.dart';
import '../../../service/http_client/model/http_error.dart';
import '../../../service/navigation/routes.dart';
import '../../../util/engagment/snackbars.dart';
import '../../../util/validators/email_validator.dart';
import '../../../util/validators/password_validator.dart';
import 'model/register_response.dart';

class RegisterController extends GetxController {
  //Overrides
  @override
  void onInit() {
    getCountries();
    super.onInit();
  }

  //Declarations
  final Rx<TextEditingController> _fullNameTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _addressTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _commercialNameTextFieldController =
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
  final RxString _commercialNameErrorMessage = ''.obs;
  final RxString _emailErrorMessage = ''.obs;
  final RxString _phoneNumberErrorMessage = ''.obs;
  final RxString _passwordErrorMessage = ''.obs;
  final RxString _confirmPasswordErrorMessage = ''.obs;

  final RxInt _registerationProgress = 1.obs;

  final RxList<CountryResponse> _countryList = <CountryResponse>[].obs;
  final RxString _selectedCountryValue = 'Loading...'.obs;
  final RxString _selectedStateValue = 'Loading...'.obs;
  final RxString _selectedCurrencyValue = 'Loading...'.obs;

  final RxBool _isLoading = false.obs;

  //Getters
  TextEditingController get fullNameTextFieldController =>
      _fullNameTextFieldController.value;
  TextEditingController get addressTextFieldController =>
      _addressTextFieldController.value;
  TextEditingController get commercialNameTextFieldController =>
      _commercialNameTextFieldController.value;
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
  String get commercialNameErrorMessage => _commercialNameErrorMessage.value;
  String get emailErrorMessage => _emailErrorMessage.value;
  String get phoneNumberErrorMessage => _phoneNumberErrorMessage.value;
  String get passwordErrorMessage => _passwordErrorMessage.value;
  String get confirmPasswordErrorMessage => _confirmPasswordErrorMessage.value;

  int get registerationProgress => _registerationProgress.value;

  List<CountryResponse> get countryList => _countryList.toList();
  String get selectedCountryValue => _selectedCountryValue.value;
  String get selectedStateValue => _selectedStateValue.value;
  String get selectedCurrencyValue => _selectedCurrencyValue.value;

  bool get isLoading => _isLoading.value;

  //Logic
  changeRegisterationProgress(int step) {
    _registerationProgress.value = step;
  }

  selectCountry(value) {
    _selectedCountryValue.value = value;
  }

  selectState(value) {
    _selectedStateValue.value = value;
  }

  selectCurrency(value) {
    _selectedCurrencyValue.value = value;
  }

  resetErrorMessages() {
    _fullNameErrorMessage.value = '';
    _addressErrorMessage.value = '';
    _emailErrorMessage.value = '';
    _phoneNumberErrorMessage.value = '';
    _passwordErrorMessage.value = '';
    _confirmPasswordErrorMessage.value = '';
    _commercialNameErrorMessage.value = '';
  }

  bool validateForm() {
    bool isValid = true;
    resetErrorMessages();

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

  showErrorMessages(HttpError<RegisterError>? errors) {
    _fullNameErrorMessage.value = errors?.details?.name ?? '';
    _addressErrorMessage.value = errors?.details?.address ?? '';
    _emailErrorMessage.value = errors?.details?.email ?? '';
    _phoneNumberErrorMessage.value = errors?.details?.phone ?? '';
    _passwordErrorMessage.value = errors?.details?.password ?? '';
    _commercialNameErrorMessage.value = errors?.details?.commercialName ?? '';

    AppSnackBars.showError('${errors?.message}');
  }

  getCountries() async {
    GeneralResponse<CountryResponse, dynamic> response =
        await AuthenticationRepository().getCountriesApi();

    _countryList.addAll(response.listData ?? []);
    if (countryList.isEmpty) {
      _selectedCountryValue.value = 'Loading...';
      _selectedStateValue.value = 'Loading...';
      _selectedCurrencyValue.value = 'Loading...';
    } else {
      _selectedCountryValue.value =
          countryList.first.country?.name ?? 'Loading...';

      _selectedStateValue.value =
          countryList.first.states?.first.name ?? 'Loading...';

      _selectedCurrencyValue.value =
          countryList.first.currencies?.first.name ?? 'Loading...';
    }
  }

  register() async {
    _isLoading.value = true;
    bool isValid = validateForm();
    if (!isValid) {
      _isLoading.value = false;
      return;
    }

    Map<String, String> requestBody = {
      'name': fullNameTextFieldController.text,
      'email': emailTextFieldController.text,
      'phone': phoneNumberTextFieldController.text,
      'password': passwordTextFieldController.text,
      'password_confirmation': confirmPasswordTextFieldController.text,
      'address': addressTextFieldController.text,
      'commercial_name': commercialNameTextFieldController.text,
      'fcm_token': 'Test FCM Token',
      'country_id':
          '${countryList.firstWhere((element) => element.country?.name == selectedCountryValue).country?.id}',
      'state_id':
          '${countryList.firstWhere((element) => element.country?.name == selectedCountryValue).states?.firstWhere((element) => element.name == selectedStateValue).id}',
      'currency_id':
          '${countryList.firstWhere((element) => element.country?.name == selectedCountryValue).currencies?.firstWhere((element) => element.name == selectedCurrencyValue).id}',
    };

    GeneralResponse<RegisterResponse, RegisterError> response =
        await RegisterRepository().registerApi(requestBody);

    if (!response.success) {
      _isLoading.value = false;
      showErrorMessages(response.error);
    } else {
      _isLoading.value = false;
      Get.toNamed(Routes.oneTimePassword,
          parameters: {'token': response.data?.otpToken ?? ''});
    }
  }
}
