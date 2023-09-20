import 'package:get/get.dart';

import '../../local_storage_manager/local_storage_manager_app.dart';

class FirstTimeService extends GetxService {
  Future<FirstTimeService> init() async => this;

  @override
  void onInit() {
    checkIfFirstTime();
    super.onInit();
  }

  final RxBool _isFirstTime = false.obs;

  bool get isFirstTime => _isFirstTime.value;

  checkIfFirstTime() {
    LocalStorageManagerApp localStorageManager = LocalStorageManagerApp();

    bool isFirstTimeOpen = localStorageManager.getFirstTimeToUseTheApp();
    if (isFirstTimeOpen) {
      _isFirstTime.value = true;
    } else {
      _isFirstTime.value = false;
    }
  }
}
