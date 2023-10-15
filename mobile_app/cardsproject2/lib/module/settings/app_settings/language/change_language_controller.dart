import 'package:get/get.dart';

import '../../../../service/local_storage_manager/local_storage_manager_app.dart';
import '../../../../translation/localizations.dart';

class ChangeLanguageController extends GetxController {
  @override
  onInit() async {
    getSelectedLanguage();
    super.onInit();
  }

  //Declarations
  final LocalStorageManagerApp _storageManager = LocalStorageManagerApp();
  final RxString _selectedLanguage = ''.obs;

  //Getters
  String get selectedLanguage => _selectedLanguage.value;

  //Logic
  getSelectedLanguage() {
    _selectedLanguage.value = _storageManager.getAppLanguage();
  }

  changeSelectedLanguage(lang) {
    _selectedLanguage.value = lang;
  }

  changeLanguage() {
    Localizations().changeLocale(selectedLanguage);
    Get.back();
    // Utilities.showSuccessSnackBar(
    //     'Change Language', 'Language has been changed sucessfully');
  }
}
