import 'package:cardsproject2/module/authentication/model/user.dart';
import 'package:get/get.dart';

import '../../module/authentication/authentication_repository.dart';
import '../http_client/model/general_response.dart';
import 'local_storage_manager_app.dart';

class UserService extends GetxService {
  Future<UserService> init() async {
    await getUserData();
    return this;
  }

  final Rx<User> _user = User().obs;

  User get user => _user.value;

  getUserData() async {
    GeneralResponse<User, dynamic> response =
    await AuthenticationRepository().getUserApi();
    if (response.success) {
      _user.value = response.data ?? User();
      final LocalStorageManagerApp localStorageManagerApp =
      LocalStorageManagerApp();
      localStorageManagerApp.saveUser(user);
    }
  }
}
