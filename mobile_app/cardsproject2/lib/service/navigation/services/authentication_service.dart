import 'package:cardsproject2/module/authentication/one_time_password/model/otp_reponse.dart';
import 'package:get/get.dart';

import '../../local_storage_manager/local_storage_manager_app.dart';

class AuthenticationService extends GetxService {
  Future<AuthenticationService> init() async => this;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  final RxBool _isLoggedIn = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;

  checkLoginStatus() {
    LocalStorageManagerApp localStorageManager = LocalStorageManagerApp();

    OtpResponse? tokens = localStorageManager.getUserTokens();

    if (tokens != null) {
      _isLoggedIn.value = true;
    } else {
      _isLoggedIn.value = false;
    }
  }
}
