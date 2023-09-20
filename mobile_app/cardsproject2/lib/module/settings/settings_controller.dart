import 'package:cardsproject2/service/local_storage_manager/local_storage_manager_app.dart';
import 'package:cardsproject2/service/navigation/routes.dart';
import 'package:get/get.dart';

import '../authentication/model/user.dart';

class SettingsController extends GetxController {
  //Declerations
  final LocalStorageManagerApp localStorageManagerApp =
      LocalStorageManagerApp();
  final Rx<User> _user = User().obs;

  //Getters
  User get user => _user.value;

  //Logic
  @override
  onInit() {
    super.onInit();
    getUserData();
  }

  getUserData() async {
    User? localUser = localStorageManagerApp.getUser();
    if (localUser != null) {
      _user.value = localUser;
    }
  }

  logout() async {
    await localStorageManagerApp.removeUserTokens();
    await localStorageManagerApp.removeUser();
    Get.offAllNamed(Routes.login);
  }
}
