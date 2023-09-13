import 'package:get/get.dart';

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
    // LocalStorageUserManager _localStorageManager = LocalStorageUserManager();

    // LoginData? user = _localStorageManager.getLoginResponseData();

    // bool loginStatus = _localStorageManager.getLoginStatus();

    // if (loginStatus && user != null) {
    //   _isLoggedIn.value = true;
    // } else {
    //   _isLoggedIn.value = false;
    // }
  }
}
