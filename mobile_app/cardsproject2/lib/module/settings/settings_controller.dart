import 'package:cardsproject2/service/local_storage_manager/local_storage_manager_app.dart';
import 'package:cardsproject2/service/navigation/routes.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  //Declarations
  final LocalStorageManagerApp localStorageManagerApp =
      LocalStorageManagerApp();

  //Getters

  //Logic
  @override
  onInit() {
    super.onInit();
  }

  logout() async {
    await localStorageManagerApp.removeUserTokens();
    await localStorageManagerApp.removeUser();
    Get.offAllNamed(Routes.login);
  }
}
