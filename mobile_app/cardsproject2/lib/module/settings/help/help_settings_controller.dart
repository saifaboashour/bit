import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../service/http_client/model/general_response.dart';
import 'help_settings_repository.dart';
import 'model/issue_type.dart';
import 'model/terms.dart';

class HelpSettingsController extends GetxController {
  //Declarations
  final RxString _privacyPolicy = ''.obs;
  final RxString _termsAndConditions = ''.obs;
  final RxList<IssueType> _issueTypes = <IssueType>[].obs;
  final RxString _selectedIssueType = 'Loading...'.obs;
  final Rx<TextEditingController> _notesTextFieldController =
      TextEditingController().obs;

  final RxString _notesErrorMessage = ''.obs;
  final RxString _selectedIssuePhotoPath = ''.obs;

  //Getters
  String get privacyPolicy => _privacyPolicy.value;
  String get termsAndConditions => _termsAndConditions.value;
  List<IssueType> get issueTypes => _issueTypes.toList();
  String get selectedIssueType => _selectedIssueType.value;
  TextEditingController get notesTextFieldController =>
      _notesTextFieldController.value;

  String get notesErrorMessage => _notesErrorMessage.value;
  String get selectedIssuePhotoPath => _selectedIssuePhotoPath.value;

  //Logic
  @override
  onInit() {
    getPrivacyPolicy();
    getTermsAndConditions();
    getIssueTypesData();
    super.onInit();
  }

  getPrivacyPolicy()async{
    GeneralResponse<Terms, dynamic> response =
        await HelpSettingsRepository().getPrivacyPolicyApi();
    if (response.success) {
      _privacyPolicy.value = response.data?.details ?? '';
    }
  }

  getTermsAndConditions()async{
    GeneralResponse<Terms, dynamic> response =
    await HelpSettingsRepository().getTermsAndConditionsApi();
    if (response.success) {
      _termsAndConditions.value = response.data?.details ?? '';
    }
  }

  changeSelectedIssueType(String issueType){
    _selectedIssueType.value = issueType;
  }

  selectIssuePhotoPath(String? path) {
    if (path != null) {
      _selectedIssuePhotoPath.value = path;
    }
  }

  getIssueTypesData() async {
    GeneralResponse<IssueType, dynamic> response =
    await HelpSettingsRepository().getIssueTypesApi();
    if (response.success) {
      _issueTypes.addAll(response.listData ?? []);
      _selectedIssueType.value = issueTypes.first.name ?? 'Loading...';
    }
  }

  reportIssue()async{
    // resetBankTransferErrorMessages();
    int selectedIssueTypeId = issueTypes
        .firstWhere((issueType) => issueType.name == selectedIssueType)
        .id ??
        0;

    Map<String, String> requestBody = {
      'issue_type_id': '$selectedIssueTypeId',
      'description': notesTextFieldController.text,
    };

    http.MultipartFile photo =
        await http.MultipartFile.fromPath('image', selectedIssuePhotoPath);

    List<http.MultipartFile> files = [
      photo,
    ];

    GeneralResponse<dynamic, dynamic> response = await HelpSettingsRepository()
        .reportIssueApi(requestBody, files);

    if (!response.success) {
      // showBankTransferErrorMessages(response.error);
    } else {
      Get.back();
    }
  }
}