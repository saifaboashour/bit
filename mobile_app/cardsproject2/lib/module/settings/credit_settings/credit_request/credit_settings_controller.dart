import 'package:cardsproject2/module/authentication/model/currency.dart';
import 'package:cardsproject2/module/settings/credit_settings/credit_request/credit_request_repository.dart';
import 'package:cardsproject2/module/settings/credit_settings/credit_request/model/supported_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../service/http_client/model/general_response.dart';
import '../../../../service/http_client/model/http_error.dart';
import '../../../../service/local_storage_manager/user_service.dart';
import '../../../../util/engagment/snackbars.dart';
import 'model/request_credit_bank_transfer_error.dart';
import 'model/request_credit_prepaid_error.dart';

class CreditSettingsController extends GetxController {
  //Declarations
  //Request Credit Bank Transfer
  final Rx<TextEditingController> _amountTextFieldController =
      TextEditingController().obs;
  final Rx<TextEditingController> _notesTextFieldController =
      TextEditingController().obs;

  final RxString _amountErrorMessage = ''.obs;
  final RxString _notesErrorMessage = ''.obs;

  final RxList<SupportedAccount> _supportedAccounts = <SupportedAccount>[].obs;
  final RxString _selectedSupportedAccount = ''.obs;
  final RxString _selectedTransferPhotoPath = ''.obs;

  //Prepaid
  final Rx<TextEditingController> _cardNumberTextFieldController =
      TextEditingController().obs;

  final RxString _cardNumberErrorMessage = ''.obs;

  //Change Currency
  final RxList<Currency> _currencies = <Currency>[].obs;
  final RxString _selectedCurrency = 'Loading...'.obs;

  //QR Code
  MobileScannerController qrCodeCameraController = MobileScannerController();
  final RxString _scannedQRCode = ''.obs;

  //Getters
  //Request Credit Bank Transfer
  TextEditingController get amountTextFieldController =>
      _amountTextFieldController.value;
  TextEditingController get notesTextFieldController =>
      _notesTextFieldController.value;

  String get amountErrorMessage => _amountErrorMessage.value;
  String get notesErrorMessage => _notesErrorMessage.value;

  List<SupportedAccount> get supportedAccounts => _supportedAccounts.toList();

  String get selectedSupportedAccount => _selectedSupportedAccount.value;

  String get selectedTransferPhotoPath => _selectedTransferPhotoPath.value;

  //Prepaid
  TextEditingController get cardNumberTextFieldController =>
      _cardNumberTextFieldController.value;

  String get cardNumberErrorMessage => _cardNumberErrorMessage.value;

  //Change Currency
  List<Currency> get currencies => _currencies.toList();
  String get selectedCurrency => _selectedCurrency.value;

  //QR Code
  String get scannedQRCode => _scannedQRCode.value;

  //Logic
  @override
  onInit() {
    getSupportedAccountsData();
    getCurrenciesData();
    super.onInit();
  }

  getSupportedAccountsData() async {
    GeneralResponse<SupportedAccount, dynamic> response =
        await CreditRequestRepository().getSupportedAccountsApi();
    if (response.success) {
      _supportedAccounts.addAll(response.listData ?? []);
      _selectedSupportedAccount.value = supportedAccounts.first.name ?? '';
    }
  }

  getCurrenciesData() async {
    GeneralResponse<Currency, dynamic> response =
        await CreditRequestRepository().getCurrenciesApi();
    if (response.success) {
      _currencies.addAll(response.listData ?? []);
    }
  }

  changeSelectedSupportedAccount(String value) {
    _selectedSupportedAccount.value = value;
  }

  selectTransferPhotoPath(String? path) {
    if (path != null) {
      _selectedTransferPhotoPath.value = path;
    }
  }

  bool validateBankTransferForm() {
    bool isValid = true;
    if (selectedTransferPhotoPath == '') {
      return false;
    }
    if (selectedSupportedAccount == '') {
      return false;
    }
    if (amountTextFieldController.text.isEmpty) {
      _amountErrorMessage.value = '';
      return false;
    }
    if (notesTextFieldController.text.isEmpty) {
      _notesErrorMessage.value = '';
      return false;
    }
    return isValid;
  }

  resetBankTransferErrorMessages() {
    _amountErrorMessage.value = '';
    _notesErrorMessage.value = '';
  }

  showBankTransferErrorMessages(HttpError<RequestCreditBankTransferError>? errors) {
    _amountErrorMessage.value = errors?.details?.amount ?? '';
    _notesErrorMessage.value = errors?.details?.notes ?? '';

    AppSnackBars.showError('${errors?.message}');
  }

  requestCreditBankTransfer() async {
    bool isValid = validateBankTransferForm();
    if (!isValid) {
      return;
    }
    resetBankTransferErrorMessages();
    int selectedSupportAccountId = supportedAccounts
            .firstWhere((account) => account.name == selectedSupportedAccount)
            .id ??
        0;

    Map<String, String> requestBody = {
      'amount': amountTextFieldController.text,
      'notes': notesTextFieldController.text,
      'supported_account_id':'$selectedSupportAccountId',
    };

    http.MultipartFile photo =
        await http.MultipartFile.fromPath('image', selectedTransferPhotoPath);

    List<http.MultipartFile> files = [
      photo,
    ];

    GeneralResponse<dynamic, RequestCreditBankTransferError> response = await CreditRequestRepository()
        .requestCreditBankTransferApi(requestBody, files);

    if (!response.success) {
      showBankTransferErrorMessages(response.error);
    } else {
      Get.back();
    }
  }

  bool validatePrepaidForm(){
    bool isValid = true;
    return isValid;
  }

  resetPrepaidErrorMessages(){
    _cardNumberErrorMessage.value = '';
  }

  showPrepaidErrorMessages(HttpError<RequestCreditPrepaidError>? errors){
    _cardNumberErrorMessage.value = errors?.details?.cardNumber ?? '';

    AppSnackBars.showError('${errors?.message}');
  }

  requestCreditPrepaid() async {
    bool isValid = validatePrepaidForm();
    if (!isValid) {
      return;
    }
    resetPrepaidErrorMessages();

    Map<String, String> requestBody = {
      'number': cardNumberTextFieldController.text,
    };

    GeneralResponse<dynamic, RequestCreditPrepaidError> response = await CreditRequestRepository()
        .requestCreditPrepaidApi(requestBody);

    if (!response.success) {
      showPrepaidErrorMessages(response.error);
    } else {
      Get.back();
    }
  }

  changeSelectedCurrency(String currency){
    _selectedCurrency.value = currency;
  }

  changeCurrency() async{

    Map<String, String> requestBody = {
      '_method': 'PUT',
      'currency_id': '${currencies.firstWhere((element) => element.name == selectedCurrency).id}',
    };

    GeneralResponse<dynamic, dynamic> response = await CreditRequestRepository()
        .updateCurrencyApi(requestBody);

    if (!response.success) {
      // showBankTransferErrorMessages(response.error);
    } else {
      final userService = Get.find<UserService>();
      userService.getUserData();
      Get.back();
    }
  }

}
