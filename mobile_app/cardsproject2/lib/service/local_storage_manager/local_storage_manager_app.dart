import 'package:cardsproject2/module/authentication/one_time_password/model/otp_reponse.dart';
import 'package:cardsproject2/service/navigation/services/authentication_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../module/authentication/model/user.dart';

class LocalStorageManagerApp {
  final storageReference = GetStorage();

  //First Time To Use The Application
  saveFirstTimeToUseTheApp(bool isFirstTime) async {
    await storageReference.write("isFirstTime", isFirstTime);
  }

  bool getFirstTimeToUseTheApp() {
    bool? isFirstTime = storageReference.read("isFirstTime");
    return isFirstTime ?? true;
  }

  //Authentication
  saveUserTokens(OtpResponse? tokens) async {
    if (tokens != null) {
      await storageReference.write("tokens", tokens.toJson());
      AuthenticationService authenticationService = Get.find();
      authenticationService.checkLoginStatus();
    }
  }

  removeUserTokens() async {
    await storageReference.remove('tokens');
    AuthenticationService authenticationService = Get.find();
    authenticationService.checkLoginStatus();
  }

  OtpResponse? getUserTokens() {
    var tokens = storageReference.read<Map<String, dynamic>>("tokens");
    if (tokens != null) {
      return OtpResponse.fromJson(tokens);
    } else {
      return null;
    }
  }

  //User
  saveUser(User user) async {
    await storageReference.write("user", user.toJson());
  }

  removeUser() async {
    await storageReference.remove('user');
  }

  User? getUser() {
    var user = storageReference.read<Map<String, dynamic>>("user");
    if (user != null) {
      return User.fromJson(user);
    } else {
      return null;
    }
  }

  //App Language
  saveAppLanguage(String lang) {
    storageReference.write('language', lang);
  }

  String getAppLanguage() {
    return storageReference.read('language') ?? "English";
  }
}
